import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../style/app_theme.dart';

abstract interface class ThemeDataSource {
  Future<void> setTheme(AppTheme theme);
  Future<AppTheme?> getTheme();
}

final class ThemeDataSourceLocal implements ThemeDataSource {
  const ThemeDataSourceLocal({
    required this.secureStorage,
    required this.codec,
  });

  final FlutterSecureStorage secureStorage;
  final Codec<ThemeMode, String> codec;

  @override
  Future<void> setTheme(AppTheme theme) async => await secureStorage.write( key:
  'settings.theme',
    value: codec.encode(theme.mode),
  );

  @override
  Future<AppTheme?> getTheme() async {
    final type = await secureStorage.read(key: 'settings.theme');

    if (type == null) return null;

    return AppTheme(mode: codec.decode(type));
  }
}
