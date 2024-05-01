import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skuterlar_shop/core/style/colors.dart';

class WTextfield extends StatelessWidget {
  final double? height;
  final String hintText;
  final bool truePrefixText;
  final bool trueBorder;
  final bool onlyDigital;
  final TextEditingController? controller;
  const WTextfield({
    super.key,
    required this.hintText,
    this.height,
    this.controller,
    this.truePrefixText = false,
    this.trueBorder = false,
    this.onlyDigital = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.maxFinite,
      child: TextFormField(
        inputFormatters: onlyDigital
            ? [
                FilteringTextInputFormatter.digitsOnly,
              ]
            : null,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: trueBorder
                ? BorderSide(color: AppColors.color_0157BE)
                : BorderSide.none,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          prefixText: '+998 ',
          prefixStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.color_000000.withOpacity(0.5),
          ),
          filled: true,
          fillColor: AppColors.color_F2F4F7,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.color_C2C2C2,
          ),
          border: OutlineInputBorder(
            borderSide: trueBorder
                ? BorderSide(color: AppColors.color_0157BE)
                : BorderSide.none,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
