import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/src/core/style/colors.dart';
import 'package:skuterlar_shop/src/core/style/icons.dart';
import 'package:skuterlar_shop/src/core/widgets/w_button.dart';
import 'package:skuterlar_shop/src/core/widgets/w_textfield.dart';
import 'package:skuterlar_shop/src/data/entity/productRequestModel.dart';
import 'package:skuterlar_shop/src/feature/announce/view_model/announce_controller.dart';

import '../widgets/w_texrfield_add.dart';

class WAdAdapter extends ConsumerWidget {
  const WAdAdapter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(announceController);
    var con = ref.read(announceController);
    List<String> CorpusTitle = [
      "Metal",
      "Aluminiy",
      "Plastik",
      "Plastik va Metal"
    ];
    List<String> HolatTitle = ["Ideal", "Yaxshi", "Qoniqarli", "Yomon"];
    List<String> ColorTitle = [
      "Oq",
      "Qora",
      "Kulrang",
    ];
    return SliverToBoxAdapter(
      child: con.state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Chiqarilgan yili".tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => con.pickYear(context),
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.color_F2F4F7,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.color_0157BE),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          labelText: con.selectedYear ?? 'Yilini tanlang'.tr(),
                          suffixIcon: Image.asset(AppIcons.arrow_down),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Narxi".tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WTextfield(
                    controller: con.priceController,
                    height: 54,
                    hintText: "",
                    trueBorder: true,
                    onlyDigital: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Ma'lumot".tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText:
                          "Kuchli 350 vattli dvigatel bilan bizning 2210 elektr skuterimiz tik qiyaliklarda yoki notekis yo'llarda bo'lsin, har qanday erni zabt eta oladi.",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.color_C2C2C2,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.color_0157BE),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.color_0157BE),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Rasmlarni joylang".tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(AppIcons.frame_icon),
                        Column(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.asset(AppIcons.addIcon),
                            ),
                            Text(
                              "Rasm qo’shish",
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.color_0F00BB),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WTexrfieldAdd(
                            controller: con.modelController,
                            hintText: "Model",
                          ),
                          WTexrfieldAdd(
                            controller: con.maxSpeedController,
                            hintText: "Maksimal tezligi",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WTexrfieldAdd(
                            controller: con.powerController,
                            hintText: "Batareya quvvari",
                          ),
                          WTexrfieldAdd(
                            controller: con.luggageController,
                            hintText: "Yuk ko’tarishi (kg)",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: AppColors.color_F2F4F7,
                          border: Border.all(
                            color: AppColors.color_0157BE.withOpacity(0.5),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: ExpansionTile(
                          title: Text(
                            "Holati".tr(),
                            style: GoogleFonts.inriaSans(
                              fontSize: 16,
                            ),
                          ),
                          children: List.generate(
                            HolatTitle.length,
                            (index) {
                              return Row(
                                children: [
                                  Checkbox(
                                    shape: const CircleBorder(),
                                    value: con.selectedIndexCorpus == index,
                                    onChanged: (bool? value) {
                                      con.onTapCheckBox(value!, index);
                                      debugPrint("$index");
                                    },
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ), // Adjust this value to change the spacing
                                  Text(
                                    HolatTitle[index],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: AppColors.color_F2F4F7,
                          border: Border.all(
                            color: AppColors.color_0157BE.withOpacity(0.5),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: ExpansionTile(
                          title: Text(
                            "Korpus".tr(),
                            style: GoogleFonts.inriaSans(
                              fontSize: 16,
                            ),
                          ),
                          children: List.generate(
                            CorpusTitle.length,
                            (index) {
                              return Row(
                                children: [
                                  Checkbox(
                                    shape: const CircleBorder(),
                                    value: con.selectedIndexHolat == index,
                                    onChanged: (bool? value) {
                                      con.onTapCheckBoxHolat(value!, index);
                                      debugPrint("$index");
                                    },
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ), // Adjust this value to change the spacing
                                  Text(
                                    CorpusTitle[index],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: AppColors.color_F2F4F7,
                          border: Border.all(
                            color: AppColors.color_0157BE.withOpacity(0.5),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: ExpansionTile(
                          title: Text(
                            "Rangi".tr(),
                            style: GoogleFonts.inriaSans(
                              fontSize: 16,
                            ),
                          ),
                          children: List.generate(
                            ColorTitle.length,
                            (index) {
                              return Row(
                                children: [
                                  Checkbox(
                                    shape: const CircleBorder(),
                                    value: con.selectedIndexColor == index,
                                    onChanged: (bool? value) {
                                      con.onTapCheckBoxColor(value!, index);
                                      debugPrint("$index");
                                    },
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ), // Adjust this value to change the spacing
                                  Text(
                                    ColorTitle[index],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      "Barcha ma’lumotlar to’g’riligini tekshiring, barcha ma’lumotlar to’g’ri bo’lganidan so’ng Joylashni bosing ",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  WButton(
                    onPressed: () {},
                    text: "Joylash",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
    );
  }
}
