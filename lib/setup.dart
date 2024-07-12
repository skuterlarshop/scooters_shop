import "package:l/l.dart";

Future<void> setup() async {
  await getStorageValues();
}

String? token;

Future<void> getStorageValues() async {

  l.w(token ?? "------\n------------\n-----------\n-------" ' ====================================');
}
