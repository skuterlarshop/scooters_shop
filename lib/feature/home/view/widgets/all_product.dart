import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/icons.dart';
import 'package:skuterlar_shop/core/style/images.dart';
import 'package:skuterlar_shop/feature/home/view_model/home_controller.dart';

class WAllProduct extends ConsumerWidget {
  const WAllProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    var con = ref.read(homeController);
    List<String> productIcons = [
      AppIcons.typeIcon,
      AppIcons.kmIcon,
      AppIcons.madeIcon,
      AppIcons.priceIcon,
    ];
    List<String> productTittle = [
      "Bonvi 2210 elektr skuter ",
      "Kuchli 350 vattli dvigatel bilan",
      "2023yil",
      "3 890 000 so’m",
    ];
    return SliverList.separated(
      itemBuilder: (context, index) {
        return Container(
          color: AppColors.color_FFFFFF,
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                        fontSize:
                                            index == 0 || index == 3 ? 12 : 10,
                                        fontWeight: index == 0 || index == 3
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
                              "Andijon viloayati",
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
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
          width: double.maxFinite,
        );
      },
      itemCount: 3,
    );
  }
}


// Text(
//                               productTittle[index],
//                               style: TextStyle(
//                                 fontSize: index == 0 || index == 3 ? 14 : 10,
//                                 fontWeight: index == 0 || index == 3
//                                     ? FontWeight.w700
//                                     : FontWeight.w400,
//                               ),
//                             ),