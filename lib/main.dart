import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:sedakork/presentation/home.dart';
import 'package:sedakork/presentation/start.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sedakork/service/location_provider.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => LocationProvider()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: Home(),
      ),
    );
  }
}
