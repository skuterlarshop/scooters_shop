import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingController =
    ChangeNotifierProvider((ref) => OnboardingController());

class OnboardingController with ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  void isChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
