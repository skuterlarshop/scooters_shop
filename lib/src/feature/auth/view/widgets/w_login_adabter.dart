import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/src/core/router/route_name.dart';
import 'package:skuterlar_shop/src/core/style/icons.dart';
import 'package:skuterlar_shop/src/core/widgets/w_textfield.dart';
import 'package:skuterlar_shop/src/feature/auth/view/widgets/custom_container.dart';
import 'package:skuterlar_shop/src/feature/auth/view_model/auth_controller.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/widgets/w_button.dart';
import '../../../../data/entity/userModel.dart';

class WLoginAdabter extends ConsumerWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController marketNameController = TextEditingController();

  void registerUser(BuildContext context, WidgetRef ref, int userType) {
    final AuthController authController =
        ref.read(authControllerProvider.notifier);
    final UserModel user = UserModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      userType: userType,
      phoneNumber: "998${phoneNumberController.text}",
      marketName: marketNameController.text,
    );

    authController.registerUser(user);
  }

  WLoginAdabter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    List<String> userType = ["Foydalanuvchi", "Do'kon"];
    List<String> userIconType = [AppIcons.user_icon, AppIcons.dokon_icon];
    List<bool> userTypeCheck = [false, false];
    late final int selectIndex;
    final AuthController authController =
    ref.read(authControllerProvider.notifier);
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
                children: List.generate(
                  2,
                  (index) {
                    final isPressed = authState.pressedButtonIndex == index;
                    return WContainer(
                      onTap: () {
                        authController.setPressedButtonIndex(index);
                      },
                      text: userType[index].tr(),
                      image: userIconType[index], isButtonPressed: isPressed,
                    );
                  },
                ),
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
                          "Iltimos quydagi katigoriyalarni to’ldirishingizni so’raymiz"
                              .tr(),
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
                  WTextfield(
                    controller: phoneNumberController,
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
                  WTextfield(
                    controller: firstNameController,
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
                  WTextfield(
                    controller: lastNameController,
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
                      "Ushbu Hamkorlik bilan siz ko’plab qulayliklarga erishishingiz mumkin"
                          .tr(),
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.color_000000,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  if (authState.isLoading) const CircularProgressIndicator(),
                  if (!authState.isLoading)
                    WButton(
                      onPressed: () {
                        registerUser(context, ref, 1);
                        Navigator.pushNamed(
                          context,
                          AppRounteName.verificationPage,
                          arguments: phoneNumberController.text,
                        );
                      },
                      text: "Keyingi".tr(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
