import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/src/feature/shopping_cart/view_model/shopping_cart_controller.dart';

import '../../../../core/router/route_name.dart';
import '../../../../core/style/colors.dart';
import '../../../../data/entity/cart_model.dart';

class WFloatButtton extends ConsumerWidget {
  const WFloatButtton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartNotifier);
    var con = ref.read(cartNotifier);
    String totalSumma = con.formatAmount(con.totalPrice().toString());
    return Container(
      height: 66,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.color_FFFFFF,
        border: Border(
          top: BorderSide(
            color: AppColors.color_000000,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${cartModels.length}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: " ta mahsulot".tr(),
                        style:  const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                 Text(
                  "jami:".tr(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$totalSumma so'm",
                  style: GoogleFonts.inriaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.color_000000,
                  ),
                ),
              ],
            ),
            Container(
              height: 44,
              width: 140,
              alignment: Alignment.center,
              child: CupertinoButton(
                padding: const EdgeInsets.all(12),
                color: AppColors.color_0157BE,
                child: Text(
                  "Buyurtma berish".tr(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.color_FFFFFF,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRounteName.verifyPage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
