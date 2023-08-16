import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:sedakork/mock/comment_data.mock.dart';
import 'package:sedakork/screen/widget/comment_card.dart';
import 'package:sedakork/screen/widget/image_card.dart';
import 'package:sedakork/screen/widget/no_data.dart';
import 'package:sedakork/util/asset_constant.dart';
import 'package:sedakork/util/custom_textstyle.dart';
import 'package:sedakork/service/location_provider.dart';
import 'package:sedakork/util/screen_constant.dart';
import 'package:sedakork/util/setting_constant.dart';

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
    final lp = Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Text('${delegate(context).aluan}, Auzaie',
            style: CustomTextStyle.heading1),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              lp.getLokasi();
              Navigator.pushNamed(context, Screen.search.value);
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
      body: ScrollConfiguration(
        behavior: const MaterialScrollBehavior(),
        child: Padding(
          padding: padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                delegate(context).kedaiBerdekatan,
                style: CustomTextStyle.heading2,
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Hero(
                      tag: 'gambar-kedai',
                      child: ImageCard(
                        imagePath: restoran,
                        title: 'test',
                        onTap: () {
                          Navigator.pushNamed(
                              context, Screen.restaurantProfile.value);
                          logger.d('Imej pertama ditekan');
                        },
                      ),
                    ),
                    ImageCard(imagePath: restoran, title: 'test'),
                    ImageCard(imagePath: restoran, title: 'test'),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              // todo buat filter
              Text(
                '${delegate(context).sejarah} ${delegate(context).penilaianDanUlasan.toLowerCase()}',
                style: CustomTextStyle.heading2,
              ),
              const SizedBox(height: 10),
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
              //
              (komenTipu.isEmpty)
                  ? const NoData()
                  : Expanded(
                      child: ListView.builder(
                        itemCount: komenTipu.length,
                        itemBuilder: (context, index) => CommentCard(
                          dataKomen: komenTipu[index],
                          screenImpl: Screen.history,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
