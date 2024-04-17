import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/images.dart';
import 'package:skuterlar_shop/data/entity/banner_model.dart';
import 'package:skuterlar_shop/feature/home/view_model/home_controller.dart';

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
      "Joylash",
      "Yangi",
      "Chegirmalar",
      "Extiyot qismlar",
      "Do'konlar",
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Tavsiyalar"),
                  Text("Arzon narxlar"),
                  Text("Yange"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
