import 'package:flutter/material.dart';
import 'package:note/presentation/screens/splash_view.dart';

import '../../presentation/screens/home_view.dart';

class Routes {
  static const String homeViewRoute = "HomeView";
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeViewRoute:
        return MaterialPageRoute(
            builder: (_) => const HomeView(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (_) => const SplashView(), settings: settings);
    }
  }
}
