import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/icons.dart';
import 'package:skuterlar_shop/core/style/images.dart';
import 'package:skuterlar_shop/data/entity/product_model.dart';
import 'package:skuterlar_shop/feature/detail_page/view/pages/detail_page.dart';
import 'package:skuterlar_shop/feature/home/view_model/home_controller.dart';
import 'package:skuterlar_shop/feature/shopping_cart/view_model/shopping_cart_controller.dart';

class WAllProduct extends ConsumerWidget {
  const WAllProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    var con = ref.read(homeController);
    var cartCon = ref.read(cartNotifier);
    List<String> productIcons = [
      AppIcons.typeIcon,
      AppIcons.kmIcon,
      AppIcons.madeIcon,
      AppIcons.priceIcon,
    ];

    return SliverList.separated(
      itemCount: productModels.length,
      itemBuilder: (context, index) {
        List<String> productTittle = [
          productModels[index].name,
          productModels[index].aboutDvigitel,
          productModels[index].madeYear,
          cartCon.formatAmount(
            productModels[index].price.toString(),
          ),
        ];
        return Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              color: AppColors.color_FFFFFF,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => DetailPage(productModels[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                  AppImage.productImage,
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
                            width: 4,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 14,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                  4,
                                  (index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            productIcons[index],
                                            height: 20,
                                            width: 20,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            productTittle[index],
                                            style: TextStyle(
                                              fontSize: index == 0 || index == 3
                                                  ? 12
                                                  : 10,
                                              fontWeight:
                                                  index == 0 || index == 3
                                                      ? FontWeight.w700
                                                      : FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    height: 16,
                                    width: 16,
                                    AppIcons.locationIcon,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    productModels[index].location,
                                    style: GoogleFonts.inriaSans(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Text(
                            "Do'kon",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 34,
              width: 40,
              child: IconButton(
                onPressed: () {
                  con.likeTapped(productModels[index]);

                  var itemContain =
                      favouriteList.contains(productModels[index]);
                  if (productModels[index].isLiked) {
                    favouriteList.add(productModels[index]);
                  } else if (itemContain) {
                    favouriteList.remove(productModels[index]);
                  }
                },
                icon: productModels[index].isLiked
                    ? Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.red[200],
                      )
                    : Image.asset(
                        AppIcons.likeIcon,
                      ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
          width: double.maxFinite,
        );
      },
    );
  }
}
