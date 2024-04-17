import 'package:flutter/material.dart';
import 'package:skuterlar_shop/core/style/colors.dart';

class WSearchPage extends StatelessWidget {
  const WSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.color_FFFFFF,
        child: ListView(
          children: [
            ListTile(
              title: Text("Skuter"),
            ),
          ],
        ),
      ),
    );
  }
}
