import 'package:flutter/material.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/images.dart';

class WAllProduct extends StatelessWidget {
  const WAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return Container(
          color: AppColors.color_FFFFFF,
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
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
                      height: 4,
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
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    )
                  ],
                )
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
