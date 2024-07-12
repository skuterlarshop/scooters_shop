import "dart:async";

import "package:easy_localization/easy_localization.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:l/l.dart";
import "package:skuterlar_shop/app.dart";
import "package:skuterlar_shop/src/core/dependencies/initialization/initialization.dart";
import "package:skuterlar_shop/src/core/dependencies/widgets/dependenies_scope.dart";
import "package:skuterlar_shop/src/core/utills/error_utill.dart";

import "setup.dart";

void run() => l.capture<void>(
      () => runZonedGuarded<Future<void>>(
        () async {
      final InitializationExecutor initialization = InitializationExecutor();
      await setup();
      runApp(
        DependenciesScope(
          initialization: initialization(
            orientations: <DeviceOrientation>[
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ],
          ),
          child: ProviderScope(
            child: EasyLocalization(
              supportedLocales: const [ Locale('uz'),  Locale('ru')],
              path:
              'assets/translations', // <-- change the path of the translation files
              fallbackLocale: const Locale('ru'),
              child: const MyApp(),
            ),
          ),
        ),
      );
    },
        (Object error, StackTrace stackTrace) => ErrorUtil.logError(
      error,
      stackTrace,
      hint: "ROOT | ",
    ),
  ),
  const LogOptions(
    outputInRelease: true,
  ),
);
