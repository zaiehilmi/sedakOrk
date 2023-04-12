enum Screen {
  start,
  home,
  history,
  search,
  restaurantProfile
}

extension ScreenExtension on Screen {
  String get value {
    switch (this) {
      case Screen.start:
        return '/';
      case Screen.home:
        return 'home';
      case Screen.history:
        return 'history';
      case Screen.search:
        return 'search';
      case Screen.restaurantProfile:
        return 'restaurantProfile';
      default:
        return '';
    }
  }
}