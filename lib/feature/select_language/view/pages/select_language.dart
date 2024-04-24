import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/widgets/w_button.dart';
import 'package:skuterlar_shop/core/router/route_name.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/images.dart';
import 'package:skuterlar_shop/feature/select_language/view_model/select_lang_controller.dart';

class SelectLanguage extends ConsumerWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(selectLangNotifier);
    var con = ref.read(selectLangNotifier);
    List<String> texts = ["Русский", "O’zbekcha"];
    List<String> imageFlags = [AppImage.rusFlag, AppImage.uzbFlag];
    return Scaffold(
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
                "Skuterlar shopga xush kelibsiz",
                style: GoogleFonts.crimsonPro(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Ilova tilini tanlang",
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
                      onTap: () {
                        con.onChanged(index);
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
                text: "DAVOM ETING",
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
