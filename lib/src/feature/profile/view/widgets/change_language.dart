import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/src/feature/profile/view_model/profile_controller.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';

class ChangeLang extends ConsumerWidget {
  const ChangeLang({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(profileNotifier);
    var con = ref.read(profileNotifier);
    List<String> texts = [ "O’zbekcha","Русский"];
    List<String> imageFlags = [AppImage.uzbFlag, AppImage.rusFlag];
    List locales = ['uz', 'ru'];
    return Container(
      decoration: BoxDecoration(
        color: AppColors.color_FFFFFF,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      width: double.maxFinite,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          height: 110,
          width: double.maxFinite,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () async {
                  con.onChanged(index);
                  await context.setLocale(
                    Locale(
                      locales[index],
                    ),
                  );
                  Navigator.pop(context);
                },
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage(AppImage.ellipseOut),
                  child: con.currentIndex == index
                      ? CircleAvatar(
                          radius: 8,
                          backgroundImage: AssetImage(AppImage.ellipseIn),
                        )
                      : null,
                ),
                title: Text(
                  texts[index],
                  style: GoogleFonts.crimsonPro(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                trailing: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(
                    imageFlags[index],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Container(
                  color: AppColors.color_000000,
                  height: 2,
                  width: double.maxFinite,
                ),
              );
            },
            itemCount: texts.length,
          ),
        ),
      ),
    );
  }
}
