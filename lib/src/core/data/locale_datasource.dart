import "dart:ui";
import "package:flutter_secure_storage/flutter_secure_storage.dart";

abstract interface class LocaleDataSource {
  Future<void> setLocale(Locale locale);

  Future<Locale?> getLocale();
}

final class LocaleDataSourceLocal implements LocaleDataSource {
  const LocaleDataSourceLocal({required this.secureStorage});

  final FlutterSecureStorage secureStorage;

  @override
  Future<void> setLocale(Locale locale) async {
    await secureStorage.write(key: 'settings.locale', value: locale.languageCode,);
  }

  @override
  Future<Locale?> getLocale() async {
    final languageCode = await secureStorage.read(key: 'settings.locale');

    if (languageCode == null) return null;

    return Locale.fromSubtags(languageCode: languageCode);
  }
}
