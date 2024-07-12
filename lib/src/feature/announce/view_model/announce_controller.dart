import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final announceController = ChangeNotifierProvider((ref) => AnnounceController());
class AnnounceController with ChangeNotifier {
  bool isPressed = false;

  void onPressed() {
    isPressed = !isPressed;
    notifyListeners();
  }
}
