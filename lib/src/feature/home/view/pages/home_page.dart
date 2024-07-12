import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuterlar_shop/src/feature/home/view/widgets/all_product.dart';
import 'package:skuterlar_shop/src/feature/home/view/widgets/w_home_appbar.dart';
import 'package:skuterlar_shop/src/feature/home/view/widgets/w_home_box_adabter.dart';
import 'package:skuterlar_shop/src/feature/home/view_model/home_controller.dart';

import '../../../../core/style/colors.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    var con = ref.read(homeController);
    List<Widget> pages = const [
      WAllProduct(),
      WAllProduct(),
      WAllProduct(),
      WAllProduct(),
      WAllProduct(),
    ];

    return Scaffold(
      backgroundColor: AppColors.color_EEEEEE,
      body: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          const WHomeAdabter(),
          SliverPadding(
            padding: EdgeInsets.zero,
            sliver: pages[con.currentIndex],
          ),
        ],
      ),
    );
  }
}
