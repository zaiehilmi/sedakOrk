// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Rating and review`
  String get penilaianDanUlasan {
    return Intl.message(
      'Rating and review',
      name: 'penilaianDanUlasan',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get kawasan {
    return Intl.message(
      'Area',
      name: 'kawasan',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant name`
  String get namaKedai {
    return Intl.message(
      'Restaurant name',
      name: 'namaKedai',
      desc: '',
      args: [],
    );
  }

  /// `Add new menu`
  String get tambahMenu {
    return Intl.message(
      'Add new menu',
      name: 'tambahMenu',
      desc: '',
      args: [],
    );
  }

  /// `Meals`
  String get masaMenu {
    return Intl.message(
      'Meals',
      name: 'masaMenu',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get namaMenu {
    return Intl.message(
      'Menu',
      name: 'namaMenu',
      desc: '',
      args: [],
    );
  }

  /// `List of menu`
  String get senaraiMenu {
    return Intl.message(
      'List of menu',
      name: 'senaraiMenu',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant & cafe nearby`
  String get kedaiBerdekatan {
    return Intl.message(
      'Restaurant & cafe nearby',
      name: 'kedaiBerdekatan',
      desc: '',
      args: [],
    );
  }

  /// `you can choose more than one`
  String get huraianArahan {
    return Intl.message(
      'you can choose more than one',
      name: 'huraianArahan',
      desc: '',
      args: [],
    );
  }

  /// `Breakfast`
  String get sarapan {
    return Intl.message(
      'Breakfast',
      name: 'sarapan',
      desc: '',
      args: [],
    );
  }

  /// `Lunch`
  String get makanTengahari {
    return Intl.message(
      'Lunch',
      name: 'makanTengahari',
      desc: '',
      args: [],
    );
  }

  /// `Dinner`
  String get makanMalam {
    return Intl.message(
      'Dinner',
      name: 'makanMalam',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get kategori {
    return Intl.message(
      'Category',
      name: 'kategori',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get harga {
    return Intl.message(
      'Price',
      name: 'harga',
      desc: '',
      args: [],
    );
  }

  /// `Optional`
  String get huraianPilihan {
    return Intl.message(
      'Optional',
      name: 'huraianPilihan',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get jumlah {
    return Intl.message(
      'Total',
      name: 'jumlah',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get penilaian {
    return Intl.message(
      'Rating',
      name: 'penilaian',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get aluan {
    return Intl.message(
      'Hi',
      name: 'aluan',
      desc: '',
      args: [],
    );
  }

  /// `History of`
  String get sejarah {
    return Intl.message(
      'History of',
      name: 'sejarah',
      desc: '',
      args: [],
    );
  }

  /// `No reviews yet. Start sharing your thoughts now!`
  String get tiadaData {
    return Intl.message(
      'No reviews yet. Start sharing your thoughts now!',
      name: 'tiadaData',
      desc: '',
      args: [],
    );
  }

  /// `Report this rating`
  String get b_laporkanPenilaian {
    return Intl.message(
      'Report this rating',
      name: 'b_laporkanPenilaian',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant not found in search?`
  String get b_kedaiTiada {
    return Intl.message(
      'Restaurant not found in search?',
      name: 'b_kedaiTiada',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get b_masuk {
    return Intl.message(
      'Login',
      name: 'b_masuk',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get b_tambah {
    return Intl.message(
      'Add',
      name: 'b_tambah',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get b_batal {
    return Intl.message(
      'Cancel',
      name: 'b_batal',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get b_seterusnya {
    return Intl.message(
      'Next',
      name: 'b_seterusnya',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get b_simpan {
    return Intl.message(
      'Save',
      name: 'b_simpan',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get b_kongsi {
    return Intl.message(
      'Share',
      name: 'b_kongsi',
      desc: '',
      args: [],
    );
  }

  /// `Create new community`
  String get b_ciptaKomuniti {
    return Intl.message(
      'Create new community',
      name: 'b_ciptaKomuniti',
      desc: '',
      args: [],
    );
  }

  /// `Your name`
  String get h_namaAnda {
    return Intl.message(
      'Your name',
      name: 'h_namaAnda',
      desc: '',
      args: [],
    );
  }

  /// `Invitation code`
  String get h_kodJemputan {
    return Intl.message(
      'Invitation code',
      name: 'h_kodJemputan',
      desc: '',
      args: [],
    );
  }

  /// `Search for a restaurant`
  String get h_cari {
    return Intl.message(
      'Search for a restaurant',
      name: 'h_cari',
      desc: '',
      args: [],
    );
  }

  /// `Enter menu name`
  String get h_namaMenu {
    return Intl.message(
      'Enter menu name',
      name: 'h_namaMenu',
      desc: '',
      args: [],
    );
  }

  /// `Enter menu price`
  String get h_harga {
    return Intl.message(
      'Enter menu price',
      name: 'h_harga',
      desc: '',
      args: [],
    );
  }

  /// `A few words of review`
  String get h_penilaian {
    return Intl.message(
      'A few words of review',
      name: 'h_penilaian',
      desc: '',
      args: [],
    );
  }

  /// `Enter the restaurant name`
  String get h_namaKedai {
    return Intl.message(
      'Enter the restaurant name',
      name: 'h_namaKedai',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ms', countryCode: 'MY'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
