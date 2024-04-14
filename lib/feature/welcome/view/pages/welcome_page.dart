import 'package:flutter/material.dart';
import 'package:skuterlar_shop/core/constants/w_button.dart';
import 'package:skuterlar_shop/core/router/route_name.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/images.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Bir qadamdan so’ng harid qilishingiz mumkin",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.color_000000,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            WButton(
              text: "Keyingi ->",
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
