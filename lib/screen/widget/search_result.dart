import 'package:flutter/material.dart';
import 'package:sedakork/util/setting_constant.dart';

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
    return Container(
      color: colorScheme(context).background,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cafeName,
                  style: textTheme(context).titleMedium
                      ?.copyWith(color: colorScheme(context).primary),
                ),
                Text(
                  address,
                  style: textTheme(context).bodyMedium
                      ?.copyWith(color: colorScheme(context).secondary),
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
