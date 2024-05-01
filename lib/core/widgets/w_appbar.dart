import 'package:flutter/material.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/icons.dart';

class WAppBar extends StatelessWidget {
  final String tittle;
  final bool onOrOff;
  const WAppBar({
    super.key,
    required this.tittle,
    this.onOrOff = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: false,
      pinned: true,
      surfaceTintColor: AppColors.color_EEEEEE,
      leading: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        onTap: () => Navigator.pop(context),
        child: Image.asset(
          AppIcons.arrow_back,
        ),
      ),
      title: Text(onOrOff ? tittle : ""),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(
            4.0), // Sınır kalınlığını buradan ayarlayabilirsiniz
        child: Container(
          color: Colors.black, // Sınırın rengi siyah
          height: 1.0, // Sınırın yüksekliği
        ),
      ),
    );
  }
}
