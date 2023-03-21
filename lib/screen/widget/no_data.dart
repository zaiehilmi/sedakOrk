import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:sedakork/util/asset_constant.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    final deviceWidth = MediaQuery.of(context).size.width / 2;
    return Center(
      child: SizedBox(
        child: Column(
          children: [
            SvgPicture.asset(
              noData,
              height: deviceWidth,
            ),
            Text(
              delegate.tiadaData,
              textAlign: TextAlign.center,
              style: textTheme.labelMedium?.copyWith(
                color: CupertinoColors.label,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
