import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.color_EEEEEE,
        elevation: 2,
        shadowColor: AppColors.color_000000,
        surfaceTintColor: AppColors.color_EEEEEE,
        centerTitle: false,
        title: Text(
          "Savat",
          style: GoogleFonts.inriaSans(
            color: AppColors.color_1E1E1E,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
