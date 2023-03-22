import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sedakork/screen/widget/rectangular_textfield.dart';
import 'package:sedakork/screen/widget/search_result.dart';
import 'package:sedakork/util/setting_constant.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _showFab = true;
  late ScrollController _scrollController;

  static var search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

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
          controller: _scrollController,
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
      floatingActionButton: _showFab
          ? FloatingActionButton.extended(
              label: Text(delegate(context).b_kedaiTiada),
              onPressed: () {},
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _handleScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _showFab = false;
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _showFab = true;
      });
    }
  }
}
