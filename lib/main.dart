import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:sedakork/screen/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sedakork/service/location_provider.dart';
import 'package:sedakork/service/screen_router.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ScreenRouter.initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider()),
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
        // home: Home(),
        initialRoute: '/',
        onGenerateRoute: ScreenRouter.fluroRouter.generator,
      ),
    );
  }
}
