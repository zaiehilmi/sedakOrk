import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logger/logger.dart';
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
  static var addRestaurantName = TextEditingController();
  static var addAreaName = TextEditingController();

  var logger = Logger();

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
              onPressed: () {
                // _showBottomSheet = !_showBottomSheet;
                // logger.d('_showBottomSheet = $_showBottomSheet');
                _showAddItemSheet();
              },
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // bottomSheet: Container(
      //       padding: EdgeInsets.all(16.0),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           RectangularTextfield(
      //             hint: 'lala 1',
      //             controller: addRestaurantName,
      //           ),
      //           SizedBox(height: 16.0),
      //           RectangularTextfield(
      //             hint: 'lala 2',
      //             controller: addAreaName,
      //           ),
      //           SizedBox(height: 16.0),
      //           ElevatedButton(
      //             onPressed: () {
      //               // Save the input values and close the bottom sheet
      //               Navigator.of(context).pop();
      //             },
      //             child: Text('Add'),
      //           ),
      //         ],
      //       ),
      //     ),
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

  void _showAddItemSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
              height: MediaQuery.of(context).size.height / 2.2,
              child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        top: -20,
                        child: Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: colorScheme(context).tertiary,
                          ),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            delegate(context).namaKedai,
                            style: textTheme(context).labelLarge,
                          ),
                        ),
                        RectangularTextfield(
                          hint: delegate(context).h_namaKedai,
                          controller: addRestaurantName,
                          outline: true,
                        ),
                        const SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            delegate(context).kawasan,
                            style: textTheme(context).labelLarge,
                          ),
                        ),
                        RectangularTextfield(
                          hint:
                              'Setapal, KL', // todo nak guna nama tempat semasa guna api nanti
                          controller: addAreaName,
                          outline: true,
                        ),
                        const SizedBox(height: 25.0),
                        Center(
                          child: FilledButton(
                            onPressed: () {
                              // Save the input values and close the bottom sheet
                              Navigator.of(context).pop();
                              addAreaName.clear();
                              addRestaurantName.clear();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                delegate(context).b_simpan,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
