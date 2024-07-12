import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectLangNotifier =
    ChangeNotifierProvider((ref) => SelectlangController());

class SelectlangController with ChangeNotifier {
  int currentIndex = 0;
  void onChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }


}
