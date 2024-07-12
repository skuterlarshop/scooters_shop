import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:skuterlar_shop/src/core/style/icons.dart';
import 'package:skuterlar_shop/src/feature/home/view_model/home_controller.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';


class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    var con = ref.read(homeController);
    return SliverAppBar(
      shadowColor: AppColors.color_000000,
      elevation: 2,
      pinned: true,
      surfaceTintColor: AppColors.color_EEEEEE,
      backgroundColor: con.focusNode.hasFocus
          ? AppColors.color_FFFFFF
          : AppColors.color_EEEEEE,
      leading: CircleAvatar(
        backgroundColor: con.focusNode.hasFocus
            ? AppColors.color_FFFFFF
            : AppColors.color_EEEEEE,
        backgroundImage: AssetImage(AppImage.mainLogo),
      ),
      title: TypeAheadField(
        builder: (context, controller, focusNode) {
          return SizedBox(
            height: 50,
            child: TextFormField(
              cursorColor: AppColors.color_000000,
              controller: controller,
              focusNode: con.focusNode,
              onTap: () {
                con.handleFocusChange();
              },
              decoration: InputDecoration(
                prefixIcon: con.focusNode.hasFocus
                    ? null
                    : Image.asset(AppIcons.searchIcon),
                fillColor: con.focusNode.hasFocus
                    ? AppColors.color_EEEEEE
                    : AppColors.color_FFFFFF,
                filled: true,
                hintText: "Mahsulot va toifalarni qidirish qidirish".tr(),
                hintStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          );
        },
        itemBuilder: (context, value) {
          return const ListTile();
        },
        onSelected: (value) {},
        suggestionsCallback: (search) {
          return null;
        },
      ),
      toolbarHeight: 64,
    );
  }
}
