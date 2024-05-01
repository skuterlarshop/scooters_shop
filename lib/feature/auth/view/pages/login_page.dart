import 'package:flutter/material.dart';
import 'package:skuterlar_shop/core/widgets/w_appbar.dart';
import 'package:skuterlar_shop/core/widgets/w_button.dart';
import 'package:skuterlar_shop/feature/auth/view/widgets/w_login_adabter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          WAppBar(
            tittle: "Yangi elon",
          ),
          WLoginAdabter(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: WButton(onPressed: () {}, text: "Keyingisi"),
      ),
    );
  }
}



/*\








*/
