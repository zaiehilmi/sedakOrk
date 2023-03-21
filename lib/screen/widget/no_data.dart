import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sedakork/util/asset_constant.dart';
import 'package:sedakork/util/setting_constant.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: SizedBox(
        child: Column(
          children: [
            SvgPicture.asset(
              noData,
              height: deviceWidth(context) / 2,
            ),
            Text(
              delegate(context).tiadaData,
              textAlign: TextAlign.center,
              style: textTheme(context).labelMedium
            ),
          ],
        ),
      ),
    );
  }
}
