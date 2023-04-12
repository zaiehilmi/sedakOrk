import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:sedakork/screen/home_screen.dart';
import 'package:sedakork/screen/restaurantProfile_screen.dart';
import 'package:sedakork/screen/search_screen.dart';
import 'package:sedakork/screen/start_screen.dart';
import 'package:sedakork/util/screen_constant.dart';

class ScreenRouter {
  static FluroRouter fluroRouter = FluroRouter();

  static initRoutes() {
    fluroRouter.define(
      Screen.start.value,
      handler: startScreenHandler,
    );
    fluroRouter.define(
      Screen.home.value,
      handler: homeScreenHandler,
      transitionType: TransitionType.cupertino,
    );
    fluroRouter.define(
      Screen.search.value,
      handler: searchScreenHandler,
      transitionType: TransitionType.material,
    );
    fluroRouter.define(
      Screen.restaurantProfile.value,
      handler: restaurantProfileScreenHandler,
      transitionType: TransitionType.material,
    );
  }

  static var homeScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return WillPopScope(
          child: const Home(),
          onWillPop: () async {
            return false;
          });
    },
  );

  static var startScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return Start();
    },
  );
  static var searchScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return SearchScreen();
    },
  );
  static var restaurantProfileScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return RestaurantProfile();
    },
  );
}
