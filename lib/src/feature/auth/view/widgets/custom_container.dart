import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/src/core/style/colors.dart';

class WContainer extends StatelessWidget {
  final String text;
  final bool isUser;
  final String image;
  final void Function()? onTap;

  const WContainer({super.key, required this.text, required this.image, this.onTap,  this.isUser = false});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 54,
      width: width * 0.42,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: AppColors.color_0157BE.withOpacity(0.3),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: AppColors.color_F2F4F7,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(image),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: GoogleFonts.inriaSans(
                color: AppColors.color_000000.withOpacity(0.6),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
