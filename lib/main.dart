import 'package:flutter/material.dart';

import 'core/router/router.dart';
import 'core/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      initialRoute: Routes.splashView,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
