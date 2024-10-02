import 'package:catbreeds/core/managers/manager_route.dart';

import 'pages/pages.dart' as page;

class SplashApp extends RouteManager {
  static const String name = "/";
  static const String splash = "${SplashApp.name}/splash";
  // static const String landing = "${SplashApp.name}/landing";

  SplashApp() {
    addRoute(SplashApp.splash, (context) => const page.SplashScreenPage());
    // addRoute(SplashApp.landing, (context) => const page.LandingScreenPage());
  }
}
