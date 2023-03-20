import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sedakork/service/location_provider.dart';
import 'package:sedakork/service/screen_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final defaultColor = const Color(0xFFDE1A1A);

  @override
  void initState() {
    super.initState();
    ScreenRouter.initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized()..copyWith(secondary: defaultColor);
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(seedColor: defaultColor);
          darkColorScheme = ColorScheme.fromSeed(seedColor: defaultColor, brightness: Brightness.dark);
        }

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
            themeMode: ThemeMode.system,
            darkTheme:ThemeData.dark(),
            theme: ThemeData(
              colorScheme: lightColorScheme,

              useMaterial3: true,
            ),
            initialRoute: 'home',
            onGenerateRoute: ScreenRouter.fluroRouter.generator,
          ),
        );
      },
    );
  }
}
