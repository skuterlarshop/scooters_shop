import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuterlar_shop/src/feature/onbording/view/widgets/w_onboarding.dart';
import 'package:skuterlar_shop/src/feature/onbording/view_model/onboarding_controller.dart';

import '../../../../core/router/route_name.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';

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
            text: 'Buyurtmalarni 24 soatda yetkazish !'.tr(),
            isLastPage: false,
          ),
          WOnboardingPage(
            image: AppImage.onboardingImageTwo,
            text: 'Mudatli to’lovga harid qilsh imkoniyati'.tr(),
            isLastPage: false,
          ),
          WOnboardingPage(
            image: AppImage.onboardingImageThree,
            text: '5 kun ichida buyurtmalarni qaytarish imkoniyati'.tr(),
            isLastPage: false,
          ),
        ],
      ),
    );
  }
}
