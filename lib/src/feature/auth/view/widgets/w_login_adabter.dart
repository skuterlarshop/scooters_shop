import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/src/core/style/icons.dart';
import 'package:skuterlar_shop/src/core/widgets/w_textfield.dart';
import 'package:skuterlar_shop/src/feature/auth/view/widgets/custom_container.dart';

import '../../../../core/style/colors.dart';

class WLoginAdabter extends StatelessWidget {
  const WLoginAdabter({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(

      child: Container(
        color: const Color(0xFFFFFFFF),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Ushbu bolim faqatgina Hamkor bo’lmmoqchilar uchun !".tr(),
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.color_000000,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WContainer(
                    text: "Foydalanuvchi".tr(),
                    image: AppIcons.user_icon,
                  ),
                  WContainer(
                    text: "Do'kon".tr(),
                    image: AppIcons.dokon_icon,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 10,
              width: double.maxFinite,
              color: AppColors.color_F2F4F7,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "Assalomu alekum hurmatli hamkor !".tr(),
                          style: GoogleFonts.inriaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.color_000000,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Iltimos quydagi katigoriyalarni to’ldirishingizni so’raymiz".tr(),
                          style: GoogleFonts.inriaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.color_000000,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Telefon raqam".tr(),
                    style: GoogleFonts.inriaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.color_000000,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const WTextfield(
                    height: 54,
                    hintText: "",
                    trueBorder: true,
                    truePrefixText: true,
                    onlyDigital: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Hamkorning ismi".tr(),
                    style: GoogleFonts.inriaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.color_000000,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const WTextfield(
                    height: 54,
                    hintText: "",
                    trueBorder: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Hamkorning familiyasi".tr(),
                    style: GoogleFonts.inriaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.color_000000,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const WTextfield(
                    height: 54,
                    hintText: "",
                    trueBorder: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Ushbu Hamkorlik bilan siz ko’plab qulayliklarga erishishingiz mumkin".tr(),
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.color_000000,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // WButton(
                  //   onPressed: () {},
                  //   text: "Keyingi",
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
