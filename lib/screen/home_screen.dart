import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:sedakork/screen/widget/card.dart';
import 'package:sedakork/screen/widget/comment_card.dart';
import 'package:sedakork/util/asset_constant.dart';
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
  var logger = Logger();

  @override
  void initState() {
    super.initState();

    _positionStream = Geolocator.getPositionStream();

    var permission = Geolocator.checkPermission();
    // ignore: unrelated_type_equality_checks
    logger.i((permission != LocationPermission.denied)
        ? 'Perkhidmatan lokasi telah dibenarkan'
        : 'Perkhidmatan lokasi tidak dibenarkan');

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
        automaticallyImplyLeading: false,
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
              delegate.kedaiBerdekatan,
              style: cts.heading2,
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ImageCard(
                    imagePath: restoran,
                    title: 'test',
                    onTap: () => logger.d('Imej pertama ditekan'),
                  ),
                  ImageCard(imagePath: restoran, title: 'test'),
                  ImageCard(imagePath: restoran, title: 'test'),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Text(
              '${delegate.sejarah} ${delegate.penilaianDanUlasan.toLowerCase()}',
              style: cts.heading2,
            ),
            //! tengok balik utk guna lokasi
            // StreamBuilder<Position>(
            //   stream: _positionStream,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) {
            //       return Text('Error: ${snapshot.error}');
            //     }
            //     if (!snapshot.hasData) {
            //       return const CupertinoActivityIndicator();
            //     }

            //     Position? position = snapshot.data;
            //     lp.setDataLokasi(position!);
            //     lp.getLokasi();
            //     return Text(
            //       LocationProvider.posisiSemasa == null
            //           ? 'loading'
            //           : LocationProvider.dataLokasi!.latitude.toString() +
            //               (LocationProvider.dataLokasi!.area ?? 'kosong'),
            //       style: cts.text,
            //     );
            //   },
            // ),
            CommentCard(rating: 3, menuName: 'Nasi Ayam')
          ],
        ),
      ),
    );
  }
}
