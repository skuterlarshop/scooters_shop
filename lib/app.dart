import 'package:flutter/material.dart';
import 'package:skuterlar_shop/core/router/route_name.dart';
import 'package:skuterlar_shop/core/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRounteName.mainPage,
      routes: AppRoute.routes,
    );
  }
}
