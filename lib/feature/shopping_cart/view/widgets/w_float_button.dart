import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/data/entity/cart_model.dart';
import 'package:skuterlar_shop/feature/shopping_cart/view_model/shopping_cart_controller.dart';

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
                Text(
                  "${cartModels.length} ta mahsulot",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "jami:",
                  style: TextStyle(
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
                  "Buyurtma berish",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.color_FFFFFF,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
