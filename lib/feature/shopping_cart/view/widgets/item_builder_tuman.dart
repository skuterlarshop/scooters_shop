import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/feature/shopping_cart/view_model/shopping_cart_controller.dart';

class ItemBuilderTuman extends ConsumerWidget {
  const ItemBuilderTuman({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartNotifier);
    var con = ref.read(cartNotifier);
    List<String> tumanlar = [
      "Mingbuloq",
      "Toshbuloq",
      "To'raqo'rg'on",
      "Pop",
      "Uchqorg'on",
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
                "Yetkazib berish joyi tanlag",
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
              itemCount: tumanlar.length,
              itemBuilder: (context, index) {
                return Card(
                  color: AppColors.color_EEEEEE,
                  child: ListTile(
                    title: Text(tumanlar[index]),
                    onTap: () {
                      con.selectTextTuman(
                        tumanlar[index],
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
