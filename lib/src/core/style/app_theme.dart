import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'color_theme.dart';

@immutable
final class AppTheme {
  /// {@macro app_theme}
  AppTheme({required this.mode})
      : darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    useMaterial3: true,
  ),
        lightTheme = ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          fontFamily: null,
          colorScheme: lightColorScheme,
          primaryColor: null,
          scaffoldBackgroundColor: null,
          appBarTheme: null,
          inputDecorationTheme: null,
        );

  final ThemeMode mode;
  final ThemeData darkTheme;
  final ThemeData lightTheme;

  ThemeData computeTheme() {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark ? darkTheme : lightTheme;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AppTheme && runtimeType == other.runtimeType && mode == other.mode;

  @override
  int get hashCode => mode.hashCode;
}
