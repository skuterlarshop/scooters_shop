import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final detailController = ChangeNotifierProvider((ref) => DetailController());

class DetailController with ChangeNotifier {
  //choose colors skuter
  int currentIndex = 0;
  void onTap(int index) {
    currentIndex = index;
    notifyListeners();
  }

  //count skuter
  int count = 1;
  void onCounterUp() {
    count++;
    notifyListeners();
  }

  void onCounterDown() {
    if (count > 1) count--;
    notifyListeners();
  }

  List<int> starCount = [5, 1, 3, 4, 4];
  List<String> userNames = [
    "User123",
    "Feruza",
    "UserA928",
    "Ibroxim",
    "Oybek",
  ];

  List<String> comments = [
    "Zo’r farzandim Juda hursand bo’ldi",
    "Haydashni o’rganib oldim.",
    "Zo’r farzandim Juda hursand bo’ldi",
    "Haydashni o’rganib oldim.",
    "Zo'r ekan gap yo'q",
  ];
}
