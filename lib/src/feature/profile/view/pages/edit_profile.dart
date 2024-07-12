import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/src/feature/profile/view/widgets/w_profile_textfield.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';

class EditProfie extends ConsumerWidget {
  const EditProfie({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.color_000000,
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                        spreadRadius: 0.4,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(59),
                    border: Border(
                      bottom:
                          BorderSide(color: AppColors.color_000000, width: 10),
                    ),
                  ),
                  child: Image.asset(AppImage.userProfileBackground),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        "Sizning profilingiz".tr(),
                        style: GoogleFonts.inriaSans(
                          fontSize: 18,
                          color: AppColors.color_FFFFFF,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                         CircleAvatar(
                          radius: 46,
                          backgroundImage: AssetImage(
                            "assets/images/profile/mock_profile_image.png".tr(),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Obidjonov Behruz",
                              style: GoogleFonts.inriaSans(
                                fontSize: 22,
                                color: AppColors.color_FFFFFF,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "+998 97 060 80 62",
                              style: GoogleFonts.inriaSans(
                                fontSize: 12,
                                color: AppColors.color_FFFFFF,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                 Text(
                  "Ism".tr(),
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
                WProfileTextField(
                  controller: controller,
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  "Familiya".tr(),
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
                WProfileTextField(
                  controller: controller,
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  "Otasining ismi".tr(),
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
                WProfileTextField(
                  controller: controller,
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  "Tug'ilgan kun".tr(),
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
                WProfileTextField(
                  controller: controller,
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  "Jinsi".tr(),
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
                WProfileTextField(
                  controller: controller,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
