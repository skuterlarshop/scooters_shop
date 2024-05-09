import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';

class WItem extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const WItem({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        height: 54,
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            text,
            style: GoogleFonts.inriaSans(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
