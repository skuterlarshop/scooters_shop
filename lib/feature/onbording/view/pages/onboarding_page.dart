import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuterlar_shop/core/router/route_name.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/images.dart';
import 'package:skuterlar_shop/feature/onbording/view/widgets/w_onboarding.dart';
import 'package:skuterlar_shop/feature/onbording/view_model/onboarding_controller.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(onboardingController);
    final con = ref.read(onboardingController);
    int totalPage = 2;
    return Scaffold(
      backgroundColor: AppColors.color_FFFFFF,
      body: PageView(
        controller: con.pageController,
        onPageChanged: (value) {
          con.isChanged(value);
          if (value == totalPage) {
            Future.delayed(const Duration(milliseconds: 700), () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRounteName.selectlang, (route) => false);
            });
          }
        },
        children: [
          WOnboardingPage(
            image: AppImage.onboardingImageOne,
            text: 'Buyurtmalarni 24 soatda yetkazish !',
            isLastPage: false,
          ),
          WOnboardingPage(
            image: AppImage.onboardingImageTwo,
            text: 'Mudatli to’lovga harid qilsh imkoniyat',
            isLastPage: false,
          ),
          WOnboardingPage(
            image: AppImage.onboardingImageThree,
            text: '5 kun ichida buyurtmalarni qaytarish imkoniyati',
            isLastPage: false,
          ),
        ],
      ),
    );
  }
}
