import 'package:flutter/material.dart';
import 'package:skuterlar_shop/core/style/colors.dart';

class WTextfield extends StatelessWidget {
  final double? height;
  final String hintText;
  final TextEditingController? controller;
  const WTextfield({
    super.key,
    required this.hintText,
    this.height,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.maxFinite,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.color_F2F4F7,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.color_C2C2C2,
          ),
          border:  OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
        ),
      ),
    );
  }
}
