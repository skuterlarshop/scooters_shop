import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/icons.dart';
import 'package:skuterlar_shop/core/style/images.dart';
import 'package:skuterlar_shop/data/entity/cart_model.dart';
import 'package:skuterlar_shop/data/entity/product_model.dart';
import 'package:skuterlar_shop/feature/detail_page/view_model/detail_controller.dart';
import 'package:skuterlar_shop/feature/home/view_model/home_controller.dart';

class DetailPage extends ConsumerWidget {
  final ProductModel productModel;
  const DetailPage(
    this.productModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    ref.watch(detailController);
    var con = ref.read(homeController);
    var detailCon = ref.read(detailController);
    List<String> detailColors = [
      "Qora",
      "Oq",
      "Kulrang",
    ];

    List<String> detailInfoKey = [
      "Shahar",
      "Model",
      "Rangi",
      "Batareya quvvati",
      "Korpus",
      "Maxsimal tezlik",
      "Holati",
    ];

    List<String> detailInfoValue = [
      "Andijon viloyat",
      "2312g turb",
      "Qora",
      "20 ah / 60w",
      "Metal",
      "65km/soat",
      "Alo, Yangi",
    ];

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 16,
            ),
            Stack(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 300,
                  child: Image.asset(
                    fit: BoxFit.cover,
                    AppImage.productImage,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppIcons.aksiyaLogo),
                      Image.asset(AppIcons.shareIcon),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4,
                            (index) => Container(
                              margin: const EdgeInsets.all(2),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: index == 0
                                    ? AppColors.color_0157BE
                                    : AppColors.color_D9D9D9,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          productModel.name,
                          style: GoogleFonts.inriaSans(
                            wordSpacing: 4,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Kuchli 350 vattli dvigatel bilan bizning 2210 elektr skuterimiz tik qiyaliklarda yoki notekis yo'llarda bo'lsin, har qanday erni zabt eta oladi. ",
                            style: GoogleFonts.inriaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "3 890 000 so’m",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30, // Container'ning balandligi
                              width: 120, // Container'ning kengligi
                              alignment: Alignment
                                  .center, // Matnni o'rtasiga joylashtiradi
                              decoration: BoxDecoration(
                                color: AppColors
                                    .color_0157BE, // Container'ning rangi
                                borderRadius: BorderRadius.circular(
                                  5,
                                ), // Chekkalari yumaloqlangan
                              ),
                              child: Text(
                                "566 800 so’m/oy",
                                style: TextStyle(
                                  color: AppColors.color_FFFFFF, // Matn rangi
                                  fontSize: 12, // Matn o'lchami
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "Rangini tanlang",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            3,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  detailCon.onTap(index);
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundImage:
                                          AssetImage(AppIcons.ellipseOut),
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.color_FFFFFF,
                                        radius: 6,
                                        backgroundImage:
                                            detailCon.currentIndex == index
                                                ? AssetImage(AppIcons.ellipseIn)
                                                : null,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      detailColors[index],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      con.likeTapped(productModel);
                      var itemContain = favouriteList.contains(productModel);
                      if (productModel.isLiked) {
                        favouriteList.add(productModel);
                      } else if (itemContain) {
                        favouriteList.remove(productModel);
                      }
                    },
                    icon: productModel.isLiked
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
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              color: AppColors.color_E8E8E8,
              height: 8,
            ),
            SizedBox(
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    detailInfoKey.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                detailInfoKey[index],
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                detailInfoValue[index],
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 2,
              color: AppColors.color_E8E8E8,
              width: double.maxFinite,
            ),
            SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "3 890 000 so’m",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 34,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.color_0157BE,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: CupertinoButton(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "-1",
                                    style: TextStyle(
                                      color: AppColors.color_0F00BB,
                                    ),
                                  ),
                                  onPressed: () {
                                    detailCon.onCounterDown();
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            SizedBox(
                              height: 40,
                              width: 34,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.color_0157BE,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: CupertinoButton(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "+${detailCon.count}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.color_0157BE,
                                    ),
                                  ),
                                  onPressed: () {
                                    detailCon.onCounterUp();
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 40,
                              width: 90,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.color_0157BE,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: CupertinoButton(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "Savatga",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.color_0157BE,
                                    ),
                                  ),
                                  onPressed: () {
                                    num discountPrice =
                                        productModel.price * 0.8;
                                    CartModel model = CartModel(
                                      name: productModel.name,
                                      image: AppImage.productImage,
                                      count: detailCon.count,
                                      color: "Kulrang",
                                      shopOrUSer: false,
                                      price: productModel.price,
                                      discountPrice: discountPrice.toInt(),
                                      location: productModel.location,
                                    );
                                    cartModels.add(model);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Savatga qo'shildi"),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 180,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  10,
                                ),
                              ),
                              border: Border.all(
                                color: AppColors.color_C3C3C3,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "28+",
                                        style: GoogleFonts.inriaSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "32",
                                              style: GoogleFonts.inriaSans(
                                                fontSize: 20,
                                                color: AppColors.color_000000,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " ta qoldi",
                                              style: GoogleFonts.inriaSans(
                                                fontSize: 12,
                                                color: AppColors.color_000000,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Buyurtma",
                                    style: GoogleFonts.inriaSans(
                                      fontSize: 20,
                                      // color: AppColors.color_C3C3C3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  10,
                                ),
                              ),
                              border: Border.all(
                                color: AppColors.color_C3C3C3,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "28+",
                                        style: GoogleFonts.inriaSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "32",
                                              style: GoogleFonts.inriaSans(
                                                fontSize: 20,
                                                color: AppColors.color_000000,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " ta qoldi",
                                              style: GoogleFonts.inriaSans(
                                                fontSize: 12,
                                                // color: AppColors.color_D9D9D9,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Buyurtma",
                                    style: GoogleFonts.inriaSans(
                                      fontSize: 20,
                                      // color: AppColors.color_C3C3C3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 140,
                width: double.maxFinite,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 16,
                        width: 236,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(19),
                          ),
                          border: Border.all(
                            color: AppColors.color_C3C3C3,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detailCon.userNames[index],
                                    style: GoogleFonts.inriaSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: List.generate(
                                      detailCon.starCount[index],
                                      (value) {
                                        return Image.asset(
                                          detailCon.starCount[index] > value
                                              ? AppIcons.liteStar
                                              : AppIcons.darkStar,
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    detailCon.comments[index],
                                    style: GoogleFonts.inriaSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "10.04.2024",
                                    style: GoogleFonts.inriaSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: detailCon.comments.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List favouriteList = [];
