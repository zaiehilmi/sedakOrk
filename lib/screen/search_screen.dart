import 'package:flutter/material.dart';
import 'package:sedakork/screen/widget/rectangular_textfield.dart';
import 'package:sedakork/screen/widget/search_result.dart';
import 'package:sedakork/util/setting_constant.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme(context).surface,
      appBar: AppBar(
        backgroundColor: colorScheme(context).primaryContainer,
        title: RectangularTextfield(
          hint: delegate(context).h_cari,
          controller: search,
        ),
      ),
      body: ScrollConfiguration(
        behavior: const MaterialScrollBehavior(),
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
