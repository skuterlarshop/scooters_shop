import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/icons.dart';
import 'package:skuterlar_shop/feature/auth/view/widgets/custom_container.dart';
import 'package:skuterlar_shop/feature/announce/view/widgets/w_item.dart';

class WAnnounceAdapter extends StatelessWidget {
  const WAnnounceAdapter({super.key});

  @override
  Widget build(BuildContext context) {
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
                "Mahsulot kim tomonidan qo’yilmoqda",
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
                  text: "Foydalanuvchi",
                  image: AppIcons.user_icon,
                ),
                WContainer(
                  text: "Do'kon",
                  image: AppIcons.dokon_icon,
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
                  "Nima sotyabsiz ?",
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
                  text: "Skuter",
                ),
                const SizedBox(
                  height: 10,
                ),
                WItem(
                  onTap: () {},
                  text: "Samakat",
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
                      "Extiyot qismlar",
                      style: GoogleFonts.inriaSans(
                        fontSize: 18,
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
                                    const Text(
                                      "Shinabalon",
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
