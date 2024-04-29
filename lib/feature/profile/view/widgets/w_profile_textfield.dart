import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';

class WProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  const WProfileTextField({super.key, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.maxFinite,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: AppColors.color_FBFDFF,
          filled: true,
          hintText: hintText,
          hintStyle: GoogleFonts.inriaSans(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black45,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.color_0157BE,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
          ),
        ),
      ),
    );
  }
}
