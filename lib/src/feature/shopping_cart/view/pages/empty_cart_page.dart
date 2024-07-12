import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/src/core/style/icons.dart';
import 'package:skuterlar_shop/src/feature/home/view_model/home_controller.dart';
import 'package:skuterlar_shop/src/feature/main/view_model/main_controller.dart';

import '../../../../core/router/route_name.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';
import '../../../../data/entity/productRequestModel.dart';
import '../../../detail_page/view/pages/detail_page.dart';

class EmptyCartPage extends ConsumerWidget {
  const EmptyCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mainNotifier);
    var mainCon = ref.watch(mainNotifier);
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.color_EEEEEE,
            elevation: 2,
            shadowColor: AppColors.color_000000,
            surfaceTintColor: AppColors.color_EEEEEE,
            title: Text(
              "Savat".tr(),
              style: GoogleFonts.inriaSans(
                color: AppColors.color_1E1E1E,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 450,
              width: double.maxFinite,
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          height: 170,
                          width: 174,
                          AppImage.savatImage,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Sizning savatingizda hozircha mahsulotlar mavjud emas"
                              .tr(),
                          style: GoogleFonts.inriaSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Bosh sahifaga o’ting yoki ketakli mahsulotni qidiruv orqali toping"
                              .tr(),
                          style: GoogleFonts.inriaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 42,
                          width: 172,
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            color: AppColors.color_0157BE,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Text(
                              "Bosh sahifa".tr(),
                              style: GoogleFonts.kanit(
                                fontSize: 18,
                                color: AppColors.color_FFFFFF,
                              ),
                            ),
                            onPressed: () {
                              mainCon.tapAndPop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: double.maxFinite,
                    color: AppColors.color_EEEEEE,
                    child: Text(
                      "   Sizga yoqishi mumkin".tr(),
                      style: GoogleFonts.inriaSans(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList.separated(
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    color: AppColors.color_FFFFFF,
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRounteName.detailPage,
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        ClipRRect(
                                          child: Image.asset(
                                            AppImage.productImage,
                                            height: 130,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Image.asset(
                                            height: 10,
                                            width: 36,
                                            AppIcons.aksiyaLogo,
                                          ),
                                        )
                                      ],
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
                                            borderRadius:
                                                BorderRadius.circular(30),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                        4,
                                        (index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 4),
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
                                                    fontSize:
                                                        index == 0 || index == 3
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
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: Text(
                                  "Do'kon".tr(),
                                  style: const TextStyle(
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
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.red[200],
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
            itemCount: 3,
          ),
        ],
      ),
    );
  }
}
