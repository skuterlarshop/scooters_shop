import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:skuterlar_shop/src/core/style/colors.dart';
import 'package:skuterlar_shop/src/feature/profile/view/widgets/w_product.dart';

import '../../../../core/style/images.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "Saralaganlarim".tr(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.color_FFFFFF,
              ),
            ),
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                height: 100,
                fit: BoxFit.cover,
                width: double.maxFinite,
                AppImage.myProductImage,
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.zero,
            sliver: WProduct(),
          ),
        ],
      ),
    );
  }
}






/*
 SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 86,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(25, 17, 121, 0.10),
                    blurRadius: 12,
                    spreadRadius: 0,
                    offset: Offset(1, 0),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/profile/myproduct_image.png",
                  ),
                ),
              ),
              child: Text(
                "Mahsulotlarim",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.color_FFFFFF,
                ),
              ),
            ),
          ),




*/