import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/icons.dart';
import 'package:skuterlar_shop/core/widgets/w_button.dart';
import 'package:skuterlar_shop/core/widgets/w_textfield.dart';
import 'package:skuterlar_shop/feature/auth/view/widgets/custom_container.dart';

class WLoginAdabter extends StatelessWidget {
  const WLoginAdabter({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Ushbu bolim faqatgina Hamkor bo’lmmoqchilar uchun !",
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
                  text: "Foydalanuvchi",
                  image: AppIcons.user_icon,
                ),
                WContainer(
                  text: "Do'kon",
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
                        "Assalomu alekum hurmatli hamkor !",
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
                        "Iltimos quydagi katigoriyalarni to’ldirishingizni so’raymiz",
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
                  "Telefon raqam",
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
                  "Hamkorning ismi",
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
                  "Hamkorning familiyasi",
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
                  "Telefon raqam",
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Ushbu Hamkorlik bilan siz ko’plab qulayliklarga erishishingiz mumkin",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.color_000000,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // WButton(
                //   onPressed: () {},
                //   text: "Keyingi",
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
