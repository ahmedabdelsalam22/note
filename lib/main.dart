import 'package:flutter/material.dart';

import 'core/router/router.dart';
import 'core/style/theme.dart';

Future<void> main() async {
  runApp(const MyApp());

/*  final dio = Dio();

  final response =
      await dio.get("https://localhost:44382/api/Notes/getAllNotes");
  print(response.data);*/
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
      initialRoute: Routes.splashViewRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
