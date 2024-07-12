import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import "runner.dart" as run;

@pragma("vm:entry-point")

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  run.run();
}
