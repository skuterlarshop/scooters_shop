import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileNotifier = ChangeNotifierProvider((ref) => ProfileNotifier());

class ProfileNotifier with ChangeNotifier {
  int currentIndex = 0;

  void onChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
