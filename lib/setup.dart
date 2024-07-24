import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:l/l.dart";

Future<void> setup() async {
  await getStorageValues();
}

 FlutterSecureStorage _storage = const FlutterSecureStorage();

String? token ;

Future<void> getStorageValues() async {
  // Retrieve the token from local storage
  token = await _storage.read(key: 'token');
  l.w(token ?? "------\n------------\n-----------\n-------" ' ====================================');
}
