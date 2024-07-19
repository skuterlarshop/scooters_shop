import 'package:flutter/material.dart';
import 'package:skuterlar_shop/src/core/router/route_name.dart';
import 'package:skuterlar_shop/src/feature/home/view/pages/search_page.dart';
import 'package:skuterlar_shop/src/feature/main/view/pages/main_page.dart';
import 'package:skuterlar_shop/src/feature/onbording/view/pages/onboarding_page.dart';
import 'package:skuterlar_shop/src/feature/announce/view/pages/announce_page.dart';
import 'package:skuterlar_shop/src/feature/profile/view/pages/edit_profile.dart';
import 'package:skuterlar_shop/src/feature/profile/view/pages/mahsulotlarim_page.dart';
import 'package:skuterlar_shop/src/feature/profile/view/pages/profile_page.dart';
import 'package:skuterlar_shop/src/feature/select_language/view/pages/select_language.dart';
import 'package:skuterlar_shop/src/feature/verification/view/pages/verification_page.dart';
import 'package:skuterlar_shop/src/feature/shopping_cart/view/widgets/done_order.dart';
import 'package:skuterlar_shop/src/feature/splash/view/pages/splash_page.dart';
import 'package:skuterlar_shop/src/feature/welcome/view/pages/welcome_page.dart';

import '../../feature/announce/view/pages/enter_ad_info.dart';
import '../../feature/auth/view/pages/login_page.dart';

class AppRoute {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRounteName.splashPage: (context) => const SplashPage(),
    AppRounteName.onboardingPage: (context) => const OnboardingPage(),
    AppRounteName.mainPage: (context) => const MainPage(),
    AppRounteName.selectlang: (context) => const SelectLanguage(),
    AppRounteName.welcomePage: (context) => const WelcomePage(),
    AppRounteName.searchPage: (context) => const SearchPage(),
    AppRounteName.profilePage: (context) => const ProfilePage(),
    AppRounteName.doneOrder: (context) => const DoneOrder(),
    AppRounteName.editProfile: (context) => const EditProfie(),
    AppRounteName.myProduct: (context) => const ProductsPage(),
    AppRounteName.loginPage: (context) => const LoginPage(),
    AppRounteName.announcePage: (context) => const AnnouncePage(),
    AppRounteName.enterAdInfoPage: (context) => const EnterAdInfo(),
    AppRounteName.verificationPage: (context) => const VerificationPage(),
  };
}
