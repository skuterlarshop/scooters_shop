import 'package:flutter/material.dart';
import 'package:skuterlar_shop/core/widgets/w_appbar.dart';
import 'package:skuterlar_shop/feature/announce/view/widgets/w_ad_adapter.dart';

class EnterAdInfo extends StatelessWidget {
  const EnterAdInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          WAppBar(
            tittle: "Yangi elon",
            onOrOff: true,
          ),
          WAdAdapter(),
        ],
      ),
    );
  }
}
