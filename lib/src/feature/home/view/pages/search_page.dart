import 'package:flutter/material.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_FFFFFF,
      appBar: AppBar(
        backgroundColor: AppColors.color_FFFFFF,
        leading: CircleAvatar(
          backgroundColor: AppColors.color_FFFFFF,
          backgroundImage: AssetImage(AppImage.mainLogo),
        ),
        title: SizedBox(
          height: 50,
          child: TextFormField(
            cursorColor: AppColors.color_000000,
            decoration: InputDecoration(
              fillColor: AppColors.color_EEEEEE,
              filled: true,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        toolbarHeight: 64,
      ),
    );
  }
}
