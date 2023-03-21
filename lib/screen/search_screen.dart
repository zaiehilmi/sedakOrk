import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:sedakork/screen/widget/rectangular_textfield.dart';
import 'package:sedakork/screen/widget/search_result.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorTheme.surface,
      appBar: AppBar(
        backgroundColor: colorTheme.primaryContainer,
        title: RectangularTextfield(
          hint: delegate.h_cari,
          controller: search,
        ),
      ),
      body: ScrollConfiguration(
        behavior: MaterialScrollBehavior(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SearchResult(
                cafeName: 'Sg Golok',
                address: 'Seksyen 2, Wangsa Maju, Kuala Lumpur',
              ),
              SearchResult(
                cafeName: 'Stadium Cafe',
                address: 'Seksyen 2, Wangsa Maju, Kuala Lumpur',
              ),
              SearchResult(
                cafeName: 'Family Mart',
                address: 'Seksyen 2, Wangsa Maju, Kuala Lumpur',
              ),
              SearchResult(
                cafeName: 'Sg Golok',
                address: 'Seksyen 2, Wangsa Maju, Kuala Lumpur',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
