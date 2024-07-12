import 'dart:ui';

import 'locale_datasource.dart';


abstract interface class LocaleRepository {
  Future<Locale?> getLocale();

  Future<void> setLocale(Locale locale);
}

final class LocaleRepositoryImpl implements LocaleRepository {
  const LocaleRepositoryImpl({
    required LocaleDataSource localeDataSource,
  }) : _localeDataSource = localeDataSource;

  final LocaleDataSource _localeDataSource;

  @override
  Future<Locale?> getLocale() => _localeDataSource.getLocale();

  @override
  Future<void> setLocale(Locale locale) => _localeDataSource.setLocale(locale);
}
