import 'package:flutter/material.dart';
import 'package:skuterlar_shop/core/style/images.dart';

class DoneOrder extends StatelessWidget {
  const DoneOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Image.asset(AppImage.done_order),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Buyurtma berildi",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
