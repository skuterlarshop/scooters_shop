import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/images.dart';
import 'package:skuterlar_shop/feature/profile/view/widgets/w_profile_textfield.dart';

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
                        "Sizning profilingiz",
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
                        const CircleAvatar(
                          radius: 46,
                          backgroundImage: AssetImage(
                              "assets/images/profile/mock_profile_image.png"),
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
                const Text(
                  "Ism",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                WProfileTextField(
                  controller: controller,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Familiya",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                WProfileTextField(
                  controller: controller,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Otasining ismi",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                WProfileTextField(
                  controller: controller,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Tug'ilgan kun",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                WProfileTextField(
                  controller: controller,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Jinsi",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
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
