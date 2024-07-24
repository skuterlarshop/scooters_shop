import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuterlar_shop/src/core/style/colors.dart';
import 'package:skuterlar_shop/src/core/style/icons.dart';
import 'package:skuterlar_shop/src/core/widgets/w_textfield.dart';
import 'package:skuterlar_shop/src/feature/announce/view_model/announce_controller.dart';

class WAdAdapter extends ConsumerWidget {
  const WAdAdapter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(announceController);
    var con = ref.read(announceController);
    return SliverToBoxAdapter(
      child: Padding(
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
                      borderSide: BorderSide(color: AppColors.color_0157BE),
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
              truePrefixText: true,
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
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: Text,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
