import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/router/route_name.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/icons.dart';
import 'package:skuterlar_shop/core/style/images.dart';
import 'package:skuterlar_shop/core/widgets/w_button.dart';
import 'package:skuterlar_shop/feature/profile/view/widgets/change_language.dart';
import 'package:skuterlar_shop/feature/profile/view_model/profile_controller.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(profileNotifier);
    var con = ref.read(profileNotifier);
    List<String> iconProfile = [
      AppIcons.messangerIcon,
      AppIcons.likeIcon,
      AppIcons.shoppingCart,
    ];

    List<String> titleIcons = [
      "Chatlarim",
      "Saralanganlarim",
      "Buyurtmalarim",
    ];

    List<String> icons = [
      AppIcons.profile,
      AppIcons.setting,
      AppIcons.product,
    ];

    List<String> profileIcons = [
      AppIcons.infoIcon,
      AppIcons.smsIcon,
    ];

    List<String> profileTittles = [
      "Ma’lumot",
      "Biz bilan bog’lanish",
    ];
    List<Widget> arrows = [
      Image.asset(
        AppIcons.arrowNext,
      ),
      Image.asset(
        AppIcons.arrowNext,
      ),
      const SizedBox.shrink(),
    ];

    List<String> tittles = [
      "Profilm",
      "Sozlamalar",
      "Mahsulatlarim",
    ];

    List<String> listPartOne = [
      AppRounteName.editProfile,
      AppRounteName.editProfile,
      AppRounteName.editProfile,
    ];
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Image.asset(AppImage.userProfileBackground),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Shaxsiy Kabinent",
                        style: GoogleFonts.inriaSans(
                          fontSize: 18,
                          color: AppColors.color_FFFFFF,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 46,
                          backgroundImage: AssetImage(
                              "assets/images/profile/mock_profile_image.png"),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Obidjonov Behruz",
                              style: GoogleFonts.inriaSans(
                                fontSize: 22,
                                color: AppColors.color_FFFFFF,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "+998 97 060 80 62",
                              style: GoogleFonts.inriaSans(
                                fontSize: 12,
                                color: AppColors.color_FFFFFF,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRounteName.myProduct);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(
                                              0,
                                              3,
                                            ), // Pastga soyini tushirib berish
                                          ),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.color_FFFFFF,
                                        radius: 40,
                                        child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset(
                                            iconProfile[index],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      titleIcons[index],
                                      style: GoogleFonts.inriaSans(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: List.generate(
                3,
                (index) {
                  return Column(
                    children: [
                      const Divider(),
                      const SizedBox(
                        height: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            listPartOne[index],
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  icons[index],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  tittles[index],
                                ),
                              ],
                            ),
                            arrows[index],
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: AppColors.color_DBE4F0,
            height: 10,
            width: double.maxFinite,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    showBottomSheet(context);
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                con.currentIndex == 0
                                    ? AppImage.uzbFlag
                                    : AppImage.rusFlag,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Ilova tili",
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                con.currentIndex == 0 ? "O’zbekcha" : "Русский",
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                AppIcons.arrowNext,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    showBottomSheet(context);
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppIcons.aboutApp,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Haqida",
                              ),
                            ],
                          ),
                          Image.asset(
                            AppIcons.arrowNext,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    showBottomSheet(context);
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppIcons.location_byProfile,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Shahar",
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Namangan",
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                AppIcons.arrowNext,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: AppColors.color_DBE4F0,
            height: 10,
            width: double.maxFinite,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: List.generate(
                2,
                (index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                profileIcons[index],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                profileTittles[index],
                              ),
                            ],
                          ),
                          arrows[index],
                        ],
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 52,
              width: double.maxFinite,
              child: WButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                text: "Chiqish",
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

void showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    builder: (context) {
      return const ChangeLang();
    },
    context: context,
  );
}
