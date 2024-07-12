import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/router/route_name.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';
import '../../../../core/widgets/w_button.dart';
import '../../view_model/select_lang_controller.dart';

class SelectLanguage extends ConsumerWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(selectLangNotifier);
    var con = ref.read(selectLangNotifier);
    List<String> texts = [ "O’zbekcha","Русский"];
    List<String> imageFlags = [ AppImage.uzbFlag,AppImage.rusFlag];
    List<String> locales = ['uz', 'ru'];
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(AppImage.logoBike),
              Image.asset(AppImage.skuterlarShop),
              const Spacer(),
              Text(
                "Skuterlar shopga xush kelibsiz".tr(),
                style: GoogleFonts.crimsonPro(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Ilova tilini tanlang".tr(),
                style: GoogleFonts.crimsonPro(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              SizedBox(
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
              const Spacer(),
              WButton(
                text: "DAVOM ETING".tr(),
                onPressed: () => Navigator.pushNamed(
                  context,
                  AppRounteName.welcomePage,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
