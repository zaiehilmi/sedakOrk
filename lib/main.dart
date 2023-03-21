import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sedakork/service/location_provider.dart';
import 'package:sedakork/service/screen_router.dart';
import 'package:sedakork/util/string_constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const SedakOrk());
}

class SedakOrk extends StatefulWidget {
  const SedakOrk({super.key});

  @override
  State<SedakOrk> createState() => _SedakOrkState();
}

class _SedakOrkState extends State<SedakOrk> {
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
        //? define dark and light color scheme
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized()
            ..copyWith(secondary: defaultColor);
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(seedColor: defaultColor);
          darkColorScheme = ColorScheme.fromSeed(
              seedColor: defaultColor, brightness: Brightness.dark);
        }

        //? get the current theme
        ThemeMode themeMode = ThemeMode.system;
        Brightness platformBrightness =
            MediaQuery.platformBrightnessOf(context);
        if (platformBrightness == Brightness.dark) {
          themeMode = ThemeMode.dark;
        } else if (platformBrightness == Brightness.light) {
          themeMode = ThemeMode.light;
        }
        bool isLightMode = themeMode == ThemeMode.light;

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
            title: appTitle,
            themeMode: themeMode,
            // darkTheme: ThemeData.dark(),
            theme: ThemeData(
              colorScheme: isLightMode ? lightColorScheme : darkColorScheme,
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
