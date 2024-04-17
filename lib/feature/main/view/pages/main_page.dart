import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/icons.dart';
import 'package:skuterlar_shop/feature/chat/view/pages/chat_page.dart';
import 'package:skuterlar_shop/feature/home/view/pages/home_page.dart';
import 'package:skuterlar_shop/feature/main/view/widgets/w_builditems.dart';
import 'package:skuterlar_shop/feature/main/view_model/main_controller.dart';
import 'package:skuterlar_shop/feature/profile/view/pages/profile_page.dart';
import 'package:skuterlar_shop/feature/shopping_cart/view/pages/shopping_cart_page.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mainNotifier);
    var con = ref.read(mainNotifier);
    List<Widget> pages = const [
      HomePage(),
      ShoppingCart(),
      ChatPage(),
      ProfilePage(),
    ];
    return Scaffold(
      backgroundColor: con.selectedIndex == 0 ? AppColors.color_EEEEEE : null,
      body: pages[con.selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.color_0157BE,
        shape: const CircleBorder(),
        onPressed: () {},
        child: Image.asset(AppIcons.addIcon),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        elevation: 0,
        color: AppColors.color_FFFFFF,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BuildItems(
              index: 0,
              text: "Bosh Sahifa",
              child: Image.asset(AppIcons.homeIcon),
            ),
            BuildItems(
              index: 1,
              text: "Savat",
              child: Image.asset(AppIcons.shoppingCart),
            ),
            const SizedBox(width: 48),
            BuildItems(
              index: 2,
              text: "Suhbat",
              child: Image.asset(AppIcons.bubbleChat),
            ),
            BuildItems(
              index: 3,
              text: "Kabinet",
              child: Image.asset(AppIcons.profileIcon),
            ),
          ],
        ),
      ),
    );
  }
}
