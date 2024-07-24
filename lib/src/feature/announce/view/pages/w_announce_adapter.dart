import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/setup.dart';
import 'package:skuterlar_shop/src/core/router/route_name.dart';
import 'package:skuterlar_shop/src/core/style/colors.dart';
import 'package:skuterlar_shop/src/core/style/icons.dart';
import 'package:skuterlar_shop/src/feature/announce/view_model/announce_controller.dart';
import 'package:skuterlar_shop/src/feature/auth/view/widgets/custom_container.dart';
import 'package:skuterlar_shop/src/feature/announce/view/widgets/w_item.dart';

class WAnnounceAdapter extends ConsumerWidget {
  const WAnnounceAdapter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(announceController);
    var con = ref.read(announceController);
    List<String> icons = [
      AppIcons.shina_icon,
      AppIcons.moy_icon,
      AppIcons.aks_elektronik,
      AppIcons.diska_icon,
      AppIcons.led_icon,
      AppIcons.boshqa_icon
    ];
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Mahsulot kim tomonidan qo’yilmoqda".tr(),
                style: GoogleFonts.inriaSans(
                  fontSize: 16,
                  color: AppColors.color_000000,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WContainer(
                  text: "Foydalanuvchi".tr(),
                  image: AppIcons.user_icon,
                  isButtonPressed: false,
                  onTap: () {
                    Navigator.pushNamed(
                        context,
                        token != null
                            ? AppRounteName.enterAdInfoPage
                            : AppRounteName.loginPage);
                  },
                ),
                WContainer(
                  text: "Do'kon".tr(),
                  image: AppIcons.dokon_icon,
                  isButtonPressed: false,
                  onTap: () {
                    Navigator.pushNamed(
                        context,
                        token != null
                            ? AppRounteName.enterAdInfoPage
                            : AppRounteName.loginPage);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 10,
            width: double.maxFinite,
            color: AppColors.color_F2F4F7,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nima sotyabsiz ?".tr(),
                  style: GoogleFonts.inriaSans(
                    fontSize: 18,
                    color: AppColors.color_000000,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                WItem(
                  onTap: () {},
                  text: "Skuter".tr(),
                ),
                const SizedBox(
                  height: 10,
                ),
                WItem(
                  onTap: () {},
                  text: "Samakat".tr(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.color_F2F4F7,
                    border: Border.all(
                      color: AppColors.color_0157BE.withOpacity(0.5),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      "Extiyot qismlar".tr(),
                      style: GoogleFonts.inriaSans(
                        fontSize: 16,
                      ),
                    ),
                    children: List.generate(
                      5,
                      (index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              children: [
                                Image.asset(
                                  icons[index],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Shinabalon".tr(),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      color: AppColors.color_ECE7FA,
                                      height: 2,
                                      width: 250,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
