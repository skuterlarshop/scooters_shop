import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuterlar_shop/core/style/colors.dart';
import 'package:skuterlar_shop/core/style/icons.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> iconConnects = [
      AppIcons.connnectIcon,
      AppIcons.phoneIcon,
    ];

    List<String> connectTittle = [
      "Chat orqali Bog’lanish",
      "+998 97 060 80 62",
    ];
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.color_000000,
        elevation: 2,
        surfaceTintColor: AppColors.color_EEEEEE,
        backgroundColor: AppColors.color_EEEEEE,
        centerTitle: false,
        title: Text(
          "Bog'lanish",
          style: GoogleFonts.inriaSans(
            color: AppColors.color_1E1E1E,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                height: 72,
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.color_0157BE),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        iconConnects[0],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        connectTittle[0],
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.color_0157BE,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                height: 72,
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.color_0157BE),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        iconConnects[1],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        connectTittle[1],
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.color_0157BE,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Center(
//         child: Stack(
//           children: [
//             Image.asset(AppImage.emptyChat),
//             Image.asset(AppImage.lineChat),
//           ],
//         ),
//       ),
