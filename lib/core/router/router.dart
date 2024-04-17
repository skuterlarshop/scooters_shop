import 'package:flutter/material.dart';
import 'package:skuterlar_shop/core/router/route_name.dart';
import 'package:skuterlar_shop/feature/home/view/pages/search_page.dart';
import 'package:skuterlar_shop/feature/main/view/pages/main_page.dart';
import 'package:skuterlar_shop/feature/onbording/view/pages/onboarding_page.dart';
import 'package:skuterlar_shop/feature/select_language/view/pages/select_language.dart';
import 'package:skuterlar_shop/feature/splash/view/pages/splash_page.dart';
import 'package:skuterlar_shop/feature/welcome/view/pages/welcome_page.dart';

class AppRoute {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRounteName.splashPage: (context) => const SplashPage(),
    AppRounteName.onboardingPage: (context) => const OnboardingPage(),
    AppRounteName.mainPage: (context) => const MainPage(),
    AppRounteName.selectlang: (context) => const SelectLanguage(),
    AppRounteName.welcomePage: (context) => const WelcomePage(),
    AppRounteName.searchPage: (context) => const SearchPage(),
  };
}
