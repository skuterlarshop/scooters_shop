import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuterlar_shop/src/core/router/route_name.dart';
import 'package:skuterlar_shop/src/core/widgets/w_button.dart';
import 'package:skuterlar_shop/src/data/entity/confirm_code_model.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';
import '../../../auth/view_model/auth_controller.dart';

class VerificationPage extends ConsumerWidget {
  const VerificationPage({super.key});

  void verifyUser(BuildContext context, WidgetRef ref, ConfirmCodeModel confirm) {
    final AuthController authController = ref.read(authControllerProvider.notifier);

    authController.verifyUser(confirm).then((_) {
      final authState = ref.read(authControllerProvider);
      if (authState.token != null) {
        Navigator.pushReplacementNamed(context, AppRounteName.announcePage);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(authState.responseMessage ?? 'Verification failed')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    String code = "";

    final args = ModalRoute.of(context)?.settings.arguments as String?;
    // final String numberFormat = "998$args";
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(AppImage.verification_image),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("+998$args"),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  " raqamiga sms yuborildi ".tr(),
                ),
              ],
            ),
            Text(
              "Kodni kiriting".tr(),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                height: 70,
                child: PinFieldAutoFill(
                  decoration: BoxLooseDecoration(
                    radius: const Radius.circular(10),
                    strokeColorBuilder:
                        FixedColorBuilder(AppColors.color_D9D9D9),
                    bgColorBuilder: FixedColorBuilder(AppColors.color_D9D9D9),
                    gapSpace: 30,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  currentCode: code,
                  onCodeSubmitted: (code) {},
                  onCodeChanged: (code) {
                    if (code!.length == 4) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    }
                  },
                  codeLength: 4,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], // Faqat raqamlarni qabul qiladi
                ),
              ),
            ),
            const Spacer(),
            if (authState.isLoading) const CircularProgressIndicator(),
            if (!authState.isLoading)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: WButton(
                  onPressed: () async {
                    print("998$args");
                    ConfirmCodeModel model =
                        ConfirmCodeModel(phone: "998$args", code: code);
                    verifyUser(context, ref, model);
                  },
                  text: "Tasdiqlang".tr(),
                ),
              ),
           const SizedBox(height: 40,),
          ],),
        ),
      ),
    );
  }
}
