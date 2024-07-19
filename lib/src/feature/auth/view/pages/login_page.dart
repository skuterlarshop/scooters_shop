import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:skuterlar_shop/src/core/widgets/w_appbar.dart';
import 'package:skuterlar_shop/src/feature/auth/view/widgets/w_login_adabter.dart';

import '../../../../core/widgets/w_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          WAppBar(
            tittle: "Yangi elon".tr(),
          ),
          WLoginAdabter(),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20),
      //   child: WButton(onPressed: () {}, text: "Keyingisi".tr()),
      // ),
    );
  }
}



/*\








*/
