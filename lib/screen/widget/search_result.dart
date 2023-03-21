import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sedakork/util/setting_constant.dart' as setting;

class SearchResult extends StatelessWidget {
  String cafeName;
  String address;

  SearchResult({
    super.key,
    required this.cafeName,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    return Container(
      color: colorTheme.background,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: setting.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cafeName,
                  style: textTheme.titleMedium
                      ?.copyWith(color: colorTheme.primary),
                ),
                Text(
                  address,
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorTheme.secondary),
                ),
              ],
            ),
          ),
          const Divider(height: 0,),
        ],
      ),
    );
  }
}
