import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:sedakork/screen/home_screen.dart';
import 'package:sedakork/screen/start_screen.dart';

class ScreenRouter {
  static FluroRouter fluroRouter = FluroRouter();

  static initRoutes() {
    fluroRouter.define("/", handler: startScreenHandler);
    fluroRouter.define(
      "home",
      handler: homeScreenHandler,
      transitionType: TransitionType.cupertino,
    );
  }

  static var homeScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return WillPopScope(child: const Home(), onWillPop: () async {return false;});
    },
  );

  static var startScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return Start();
    },
  );
}
