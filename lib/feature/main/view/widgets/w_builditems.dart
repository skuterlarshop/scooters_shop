import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/feature/main/view_model/main_controller.dart';

class BuildItems extends ConsumerWidget {
  final int index;
  final String text;
  final Widget child;
  const BuildItems(
      {super.key,
      required this.index,
      required this.child,
      required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mainNotifier);
    var con = ref.read(mainNotifier);
    return InkWell(
      onTap: () => con.onItemTapped(index),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            child,
            Text(
              text,
              style: TextStyle(
                color: con.selectedIndex == index
                    ? AppColors.color_0157BE
                    : Colors.grey,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
