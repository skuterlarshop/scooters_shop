import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/style/colors.dart';



class WSearchPage extends StatelessWidget {
  const WSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.color_FFFFFF,
        child: ListView(
          children:  [
            ListTile(
              title: Text(
                "Skuter".tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
