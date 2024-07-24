import 'package:flutter/material.dart';
import 'package:skuterlar_shop/src/core/style/colors.dart';

class WTexrfieldAdd extends StatelessWidget {
  final TextEditingController  controller;
  final String hintText;
  const WTexrfieldAdd ( {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 50,
      width: width * .424,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.color_F2F4F7,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16,
            color: AppColors.color_000000.withOpacity(0.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.color_0157BE.withOpacity(0.5),),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),

      ),
    );
  }
}
