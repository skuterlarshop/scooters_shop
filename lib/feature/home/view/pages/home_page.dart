import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/images.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.color_EEEEEE,
        leading: CircleAvatar(
          backgroundColor: AppColors.color_EEEEEE,
          backgroundImage: AssetImage(AppImage.mainLogo),
        ),
        title: Container(
          decoration: BoxDecoration(),
          child: Row(
            children: [],
          ),
        ),
      ),
    );
  }
}
