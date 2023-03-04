import 'package:flutter/material.dart';

import '../../presentation/screens/home_view.dart';

class Routes {
  static String homeViewRoute = "HomeView";
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
            builder: (_) => const HomeView(), settings: settings);
    }
  }
}
