import 'package:flutter/material.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:sedakork/util/custom_textstyle.dart' as cts;
import 'package:sedakork/util/setting_constant.dart' as setting;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Text('${delegate.aluan}, Auzaie', style: cts.heading1),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
