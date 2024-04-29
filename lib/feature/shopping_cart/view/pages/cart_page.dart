import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/icons.dart';
import 'package:skuterlar_shop/data/entity/cart_model.dart';
import 'package:skuterlar_shop/data/entity/product_model.dart';
import 'package:skuterlar_shop/feature/detail_page/view/pages/detail_page.dart';
import 'package:skuterlar_shop/feature/shopping_cart/view/widgets/enter_order_information.dart';
import 'package:skuterlar_shop/feature/shopping_cart/view/widgets/w_float_button.dart';
import 'package:skuterlar_shop/feature/shopping_cart/view/widgets/w_result_order.dart';
import 'package:skuterlar_shop/feature/shopping_cart/view_model/shopping_cart_controller.dart';

class Cartpage extends ConsumerWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartNotifier);
    var con = ref.read(cartNotifier);
    return Scaffold(
      backgroundColor: AppColors.color_FFFFFF,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.color_EEEEEE,
            elevation: 2,
            shadowColor: AppColors.color_000000,
            surfaceTintColor: AppColors.color_EEEEEE,
            title: Text(
              "Savat",
              style: GoogleFonts.inriaSans(
                color: AppColors.color_1E1E1E,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverList.builder(
            itemCount: cartModels.length,
            itemBuilder: (context, index) {
              String formattedNumber =
                  con.formatAmount(cartModels[index].discountPrice.toString());
              return Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
                child: Container(
                  color: AppColors.color_FFFFFF,
                  width: double.maxFinite,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => DetailPage(
                            productModels[index],
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    "assets/images/savat/product_image.png",
                                    height: 130,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: List.generate(
                                    4,
                                    (index) => Container(
                                      margin: const EdgeInsets.all(2),
                                      height: 6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                        color: index == 0
                                            ? AppColors.color_0157BE
                                            : AppColors.color_D9D9D9,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartModels[index].name,
                                  style: GoogleFonts.inriaSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Miqdor",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.color_000000,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ": ${cartModels[index].count}",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.color_000000,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Rangi",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.color_000000,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ": ${cartModels[index].color}",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.color_000000,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Oldindi",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.color_000000,
                                        ),
                                      ),
                                      TextSpan(
                                        text: cartModels[index].shopOrUSer
                                            ? ": do'kondan"
                                            : "; foydalanuvchidan",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.color_000000,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  " ${cartModels[index].price}",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.color_000000,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  " $formattedNumber",
                                  style: GoogleFonts.inriaSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.color_000000,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Image.asset(AppIcons.location_byCart),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(cartModels[index].location),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                height: 10,
                                width: 36,
                                AppIcons.aksiyaLogo,
                              ),
                              Image.asset(
                                height: 18,
                                width: 18,
                                AppIcons.shareIcon,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          SliverToBoxAdapter(
            child: con.isChanged
                ? const WResultOrder()
                : const EnterOrderInformation(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const WFloatButtton(),
    );
  }
}
