import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:skuterlar_shop/setup.dart';
import 'package:skuterlar_shop/src/core/router/route_name.dart';
import 'package:skuterlar_shop/src/core/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute:AppRounteName.onboardingPage,
      routes: AppRoute.routes,
    );
  }
}
