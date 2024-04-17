import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeController = ChangeNotifierProvider((ref) => HomeController());

class HomeController with ChangeNotifier {
  HomeController() {
    initState();
  }
  bool isChanged = false;

  void isChangedTextfield(bool value) {
    isChanged = value;
    notifyListeners();
  }

  List<String> searchItems = [
    "skuterlar",
    "motasikl",
    "motoBike",
    "olam",
    "asergey",
  ];

  final FocusNode focusNode = FocusNode();

  void initState() {
    focusNode.addListener(handleFocusChange);
  }

  void handleFocusChange() {
    // Fokus o'zgarganda bu yerda ishlaydi va UI yangilanadi
    notifyListeners();
  }

  @override
  void dispose() {
    focusNode.removeListener(handleFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  //HomeAdabter

  int currentIndex = 0;
  void onTap(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
