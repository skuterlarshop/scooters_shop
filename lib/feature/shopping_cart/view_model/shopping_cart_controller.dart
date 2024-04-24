import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final cartNotifier = ChangeNotifierProvider((ref) => CartController());

class CartController with ChangeNotifier {
  String formatNumber(int number) {
    final formatter = NumberFormat('###,###,###');
    return formatter.format(number);
  }
}
