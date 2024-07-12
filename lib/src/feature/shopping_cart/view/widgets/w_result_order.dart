import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuterlar_shop/src/core/style/icons.dart';
import 'package:skuterlar_shop/src/feature/shopping_cart/view_model/shopping_cart_controller.dart';

import '../../../../core/style/colors.dart';
import '../../../../data/entity/cart_model.dart';

class WResultOrder extends ConsumerWidget {
  const WResultOrder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartNotifier);
    var con = ref.read(cartNotifier);
    String formatTotalPrice = con.formatAmount(con.totalPrice().toString());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: AppColors.color_F2F4F7,
          height: 10,
          width: double.maxFinite,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.color_F2F4F7,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppIcons.map_icon),
                       Column(
                        children: [
                          Text(
                            "Yetkazib berish".tr(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "bugundan: 3 kun ichida: Juma ".tr(),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        AppIcons.house_icon,
                      ),
                    ],
                  ),
                  const Divider(),
                  Column(
                    children: List.generate(
                      cartModels.length - 1,
                      (index) {
                        String foramtPrice = con.formatAmount(
                            cartModels[index].discountPrice.toString());

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${index + 1}",
                                  ),
                                   TextSpan(
                                    text: " mahsulot".tr(),
                                  ),
                                ],
                              ),
                            ),
                            Text("$foramtPrice so'm"),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      alignment: Alignment.center,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: AppColors.color_D9D9D9,
                      ),
                      child:  Text(
                        "Mahsulotni yetkazib berish 3-5 kungacha uzayishi mumkin.".tr(),
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        "umumiy harajat:".tr(),
                        style: const TextStyle(),
                      ),
                      Text("$formatTotalPrice so'm"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
