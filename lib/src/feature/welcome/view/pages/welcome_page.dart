import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/router/route_name.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';
import '../../../../core/widgets/w_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                AppImage.welcome,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Bir qadamdan so’ng xarid qilishingiz mumkin".tr(),
              style: TextStyle(
                fontSize: 20,
                color: AppColors.color_000000,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            WButton(
              text: "Keyingi ->".tr(),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, AppRounteName.mainPage, (route) => false),
            ),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
