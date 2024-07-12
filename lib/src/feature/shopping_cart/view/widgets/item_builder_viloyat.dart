import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/style/colors.dart';
import '../../view_model/shopping_cart_controller.dart';

class ItemBuilder extends ConsumerWidget {
  const ItemBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartNotifier);
    var con = ref.read(cartNotifier);
    List<String> viloyatlar = [
      "Andijon",
      "Buxoro",
      "Farg'ona",
      "Jizzax",
      "Xorazm",
      "Namangan",
      "Navoiy",
      "Qashqadaryo",
      "Qoraqalpog'iston Res",
      "Samarqand",
      "Surxandaryo",
      "Sirdaryo",
      "Toshkent",
      "Toshkent viloyat"
    ];

    final height = MediaQuery.of(context).size.height;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: con.isTapped ? height * .8 : height * .4,
      decoration: BoxDecoration(
        color: AppColors.color_FFFFFF,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 60,
            child: IconButton(
              onPressed: () {
                con.onTapped();
              },
              icon: Icon(
                con.isTapped
                    ? Icons.keyboard_arrow_down_outlined
                    : Icons.keyboard_arrow_up_outlined,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Yetkazib berish joyi tanlag".tr(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.color_000000,
                ),
              ),
            ),
          ),
          SizedBox(
            height: con.isTapped ? height * .66 : height * .28,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: viloyatlar.length,
              itemBuilder: (context, index) {
                return Card(
                  color: AppColors.color_EEEEEE,
                  child: ListTile(
                    title: Text(viloyatlar[index]),
                    onTap: () {
                      con.selectText(
                        viloyatlar[index],
                      );
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*

 void _selectRegion(BuildContext context) async {
    final selectedRegion = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: regions.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(regions[index]),
              onTap: () {
                Navigator.pop(context, regions[index]);
              },
            );
          },
        );
      },
    );

    if (selectedRegion != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tanlangan viloyat: $selectedRegion')),
      );
    }
  }
}










*/
