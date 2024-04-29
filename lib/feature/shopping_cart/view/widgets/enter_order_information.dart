import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/icons.dart';
import 'package:skuterlar_shop/core/widgets/w_textfield.dart';
import 'package:skuterlar_shop/feature/shopping_cart/view/widgets/item_builder_tuman.dart';
import 'package:skuterlar_shop/feature/shopping_cart/view/widgets/item_builder_viloyat.dart';
import 'package:skuterlar_shop/feature/shopping_cart/view/widgets/w_popover.dart';
import 'package:skuterlar_shop/feature/shopping_cart/view_model/shopping_cart_controller.dart';

class EnterOrderInformation extends ConsumerWidget {
  const EnterOrderInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartNotifier);
    var con = ref.read(cartNotifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColors.color_F2F4F7,
          height: 10,
          width: double.maxFinite,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Yetkazib berish joyi ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.color_000000,
                      ),
                    ),
                    TextSpan(
                      text: "(Shahar)",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        color: AppColors.color_000000,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              WPopover(
                leading: Image.asset(AppIcons.black_location),
                onTap: () {
                  showModelSheetDisplay(context);
                },
                text: con.text,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Tuman ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.color_000000,
                  ),
                ),
              ),
              WPopover(
                onTap: () {
                  showModelSheetDisplayTuman(context);
                },
                text: con.textTuman,
                leading: const SizedBox(
                  width: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Container(
          height: 10,
          width: double.maxFinite,
          color: AppColors.color_F2F4F7,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Buyurtmani qabul qiluvchi ",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.color_000000,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              WTextfield(
                height: 64,
                controller: con.familiyaContrl,
                hintText: "Familiya",
              ),
              const SizedBox(
                height: 20,
              ),
              WTextfield(
                height: 64,
                controller: con.ismContrl,
                hintText: "Ism",
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: con.phoneContrl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.color_F2F4F7,
                  hintText: "Telefon nomer",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.color_C2C2C2,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                autocorrect: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: AppColors.color_F2F4F7,
                width: double.maxFinite,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Yetib kelgandan so’ng naqd yoki karta orqali to’lash",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Eslatma: Buyurtma qilingan maxsulot yetib borqanidan so’ng to’lov qilinmasa buyurtma bekor qilinsa 100 ming so’m jarima to’lanadi. Bu sizga ketgan harajarlar uchun!",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          color: AppColors.color_F2F4F7,
          height: 10,
          width: double.maxFinite,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.color_F2F4F7,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: ListTile(
              leading: Image.asset(AppIcons.map_icon),
              title: Text(
                "Joylashuvni yuklash",
                style: GoogleFonts.inriaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          color: AppColors.color_F2F4F7,
          height: 10,
          width: double.maxFinite,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "Malumotlaringiz to’griligini tekshiring!",
                style: GoogleFonts.inriaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Mahsulot yetkazib beriladi Andijon shahar Paxtaobod tomaniga.",
                style: GoogleFonts.inriaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Topshiriladi Ism Familiyaga",
                style: GoogleFonts.inriaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}

void showModelSheetDisplay(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    scrollControlDisabledMaxHeightRatio: BorderSide.strokeAlignCenter,
    context: context,
    builder: (context) {
      return const ItemBuilder();
    },
  );
}

void showModelSheetDisplayTuman(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    scrollControlDisabledMaxHeightRatio: BorderSide.strokeAlignCenter,
    context: context,
    builder: (context) {
      return const ItemBuilderTuman();
    },
  );
}

// showPopover(
//                     context: context,
//                     bodyBuilder: (context) => const ItemBuilder(),
//                     height: 400,
//                     width: 300,
//                   );
