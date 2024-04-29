import 'package:flutter/material.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/icons.dart';

class WPopover extends StatelessWidget {
  final Widget leading;
  final String text;

  final Function() onTap;
  const WPopover(
      {super.key,
      required this.onTap,
      required this.text,
      required this.leading});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
        color: AppColors.color_F2F4F7,
      ),
      child: ListTile(
        leading: leading,
        title: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: AppColors.color_000000,
          ),
        ),
        trailing: InkWell(
          onTap: onTap,
          child: Image.asset(AppIcons.arrow_down),
        ),
      ),
    );
  }
}
