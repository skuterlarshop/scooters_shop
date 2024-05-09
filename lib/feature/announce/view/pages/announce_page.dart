import 'package:flutter/material.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/widgets/w_appbar.dart';
import 'package:skuterlar_shop/feature/announce/view/widgets/w_announce_adapter.dart';

class AnnouncePage extends StatelessWidget {
  const AnnouncePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_FFFFFF,
      body: const CustomScrollView(
        slivers: [
          WAppBar(
            tittle: "",
          ),
          WAnnounceAdapter(),
        ],
      ),
    );
  }
}
