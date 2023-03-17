import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:sedakork/model/location_data.dart';
import 'package:sedakork/util/custom_textstyle.dart' as cts;
import 'package:sedakork/util/setting_constant.dart' as setting;
import 'package:sedakork/service/location_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Stream<Position> _positionStream;
  final _lp = LocationProvider();

  @override
  void initState() {
    super.initState();

    _positionStream = Geolocator.getPositionStream();

    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await _lp.getLokasi());
  }

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    final lp = Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Text('${delegate.aluan}, Auzaie', style: cts.heading1),
        actions: [
          IconButton(
            onPressed: () {
              lp.getLokasi();
            },
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {
              lp.semakLokasi();
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: setting.padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              delegate.senaraiKedai,
              style: cts.heading2,
            ),
            Text(
              '${delegate.sejarah} ${delegate.penilaianDanUlasan.toLowerCase()}',
              style: cts.heading2,
            ),
            StreamBuilder<Position>(
                stream: _positionStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }

                  Position? position = snapshot.data;
                  lp.setDataLokasi(position!);
                  lp.getLokasi();
                  return Text(
                    lp.posisiSemasa == null
                        ? 'loading'
                        : lp.dataLokasi!.latitude.toString() +
                            (lp.dataLokasi!.area ?? 'kosong'),
                    style: cts.text,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
