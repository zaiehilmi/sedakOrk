import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:sedakork/util/custom_textstyle.dart' as cts;
import 'package:sedakork/util/setting_constant.dart' as setting;
import 'package:sedakork/service/location_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            onPressed: () {lp.getLokasi();},
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {lp.semakLokasi();},
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
            Text(
              // 'data'
              lp.posisiSemasa == null ? 'loading' : lp.dataLokasi.latitude.toString(),
              // style: cts.text,
            ),
          ],
        ),
      ),
    );
  }
}
