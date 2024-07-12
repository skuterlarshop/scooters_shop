import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/src/feature/onbording/view_model/onboarding_controller.dart';

import '../../../../core/style/colors.dart';

class WOnboardingPage extends ConsumerWidget {
  final String image;
  final String text;
  final bool isLastPage;

  const WOnboardingPage({
    super.key,
    required this.image,
    required this.text,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(onboardingController);
    var con = ref.read(onboardingController);
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(height: 10),
            Text(
              text.tr(),
              style: GoogleFonts.crimsonPro(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AnimatedContainer(
                      height: 14,
                      width: 14,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: con.currentIndex == index
                            ? AppColors.color_0157BE
                            : AppColors.color_D9D9D9,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
