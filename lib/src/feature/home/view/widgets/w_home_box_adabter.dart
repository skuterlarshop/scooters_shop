import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/src/core/style/colors.dart';
import 'package:skuterlar_shop/src/data/entity/banner_model.dart';
import 'package:skuterlar_shop/src/feature/home/view_model/home_controller.dart';

import '../../../../core/style/images.dart';

class WHomeAdabter extends ConsumerWidget {
  const WHomeAdabter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    var con = ref.read(homeController);
    List<String> catImages = [
      AppImage.joylashCategory,
      AppImage.newCategory,
      AppImage.discountCategory,
      AppImage.zapchastCategory,
      AppImage.shopCategory,
    ];

    List<String> catTittles = [
      "Joylash".tr(),
      "Yangi".tr(),
      "Chegirmalar".tr(),
      "Extiyot qismlar".tr(),
      "Do'konlar".tr(),
    ];

    return SliverToBoxAdapter(
      child: Container(
        height: 300,
        width: double.maxFinite,
        color: AppColors.color_FFFFFF,
        child: Column(
          children: [
            CarouselSlider(
              items: banners.map(
                (e) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    child: Center(
                      child: Text(e.tittle),
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(height: 174, autoPlay: true),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(catTittles.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        con.onTap(index);
                      },
                      child: Column(
                        children: [
                          AnimatedContainer(
                            curve: Curves.easeIn,
                            duration: const Duration(
                              milliseconds: 300,
                            ),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: con.currentIndex == index && index != 0
                                  ? Border.all(color: AppColors.color_000000)
                                  : null,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(AppImage.backgroundImageCat),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Image.asset(
                              catImages[index],
                            ),
                          ),
                          Text(
                            catTittles[index],
                            style: GoogleFonts.inriaSans(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 30,
              color: AppColors.color_EEEEEE,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Tavsiyalar".tr(),
                  ),
                  Text(
                    "Arzon narxlar".tr(),
                  ),
                  Text(
                    "Yangi".tr(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
