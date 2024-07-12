import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/entity/cart_model.dart';

final cartNotifier = ChangeNotifierProvider((ref) => CartController());

class CartController with ChangeNotifier {
  TextEditingController familiyaContrl = TextEditingController();
  TextEditingController ismContrl = TextEditingController();
  TextEditingController phoneContrl = TextEditingController();

  int totalPrice() {
    int totalSumma = 0;

    for (var i = 0; i < cartModels.length; i++) {
      totalSumma += cartModels[i].discountPrice;
    }
    return totalSumma;
  }

  String formatAmount(String value) {
    String price = value;
    String priceInText = "";
    int counter = 0;
    for (int i = (price.length - 1); i >= 0; i--) {
      counter++;
      String str = price[i];
      if ((counter % 3) != 0 && i != 0) {
        priceInText = "$str$priceInText";
      } else if (i == 0) {
        priceInText = "$str$priceInText";
      } else {
        priceInText = " $str$priceInText";
      }
    }
    return priceInText.trim();
  }

  bool isChanged = false;
  void tapChanged() {
    isChanged = !isChanged;
    notifyListeners();
  }

  String text = "";
  void selectText(String value) {
    text = value;
    notifyListeners();
  }

  String textTuman = "";
  void selectTextTuman(String value) {
    textTuman = value;
    notifyListeners();
  }

  bool isTapped = false;
  void onTapped() {
    isTapped = !isTapped;
    notifyListeners();
  }
}
