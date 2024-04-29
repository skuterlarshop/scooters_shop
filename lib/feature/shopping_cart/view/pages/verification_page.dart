import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/images.dart';
import 'package:skuterlar_shop/feature/shopping_cart/view_model/shopping_cart_controller.dart';

class VerificationPage extends ConsumerWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var con = ref.read(cartNotifier);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(AppImage.verification_image),
              const SizedBox(
                height: 20,
              ),
              Text("+${con.phoneContrl.text} raqamiga sms yuborildi "),
              const Text("Kodni kiriting"),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 58,
                        height: 70,
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: AppColors.color_D9D9D9,
                            filled: true,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            // if (value[3].length == 1) {
                            //   Navigator.pushReplacementNamed(
                            //       context, AppRounteName.doneOrder);
                            // }
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    );
                  },
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
