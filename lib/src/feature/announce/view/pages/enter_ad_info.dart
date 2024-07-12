import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:skuterlar_shop/src/core/widgets/w_appbar.dart';
import 'package:skuterlar_shop/src/feature/announce/view/widgets/w_ad_adapter.dart';

class EnterAdInfo extends StatelessWidget {
  const EnterAdInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          WAppBar(
            tittle: "Yangi elon".tr(),
            onOrOff: true,
          ),
         const WAdAdapter(),
        ],
      ),
    );
  }
}
