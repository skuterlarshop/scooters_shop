import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/entity/productRequestModel.dart';

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

  //HomeAdabter

  int currentIndex = 0;
  void onTap(int index) {
    currentIndex = index;
    notifyListeners();
  }

  int likeIndex = 0;
  void animatedLike(int value) {
    likeIndex = value;
    notifyListeners();
  }

  //like button
  void likeTapped(ProductRequestModel productModel) {
    notifyListeners();
  }

  @override
  void dispose() {
    focusNode.removeListener(handleFocusChange);
    focusNode.dispose();
    super.dispose();
  }
}
