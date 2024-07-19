import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:skuterlar_shop/src/core/style/colors.dart';

class WAdAdapter extends StatelessWidget {
  const WAdAdapter({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Chiqarilgan yili".tr(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
