import 'package:catbreeds/core/managers/manager_route.dart';

import 'pages/pages.dart' as page;

class HomeApp extends RouteManager {
  static const String name = "/home";
  static const String splash = "${HomeApp.name}/splash";
  static const String landing = "${HomeApp.name}/landing";
  static const String detail = "${HomeApp.name}/detail";

  HomeApp() {
    addRoute(HomeApp.splash, (context) => const page.SplashScreenPage());
    addRoute(HomeApp.landing, (context) => const page.LandingScreenPage());
    addRoute(HomeApp.detail, (context) => const page.DetailScreenPage());
  }
}
