import 'dart:async';

import 'package:flutter/foundation.dart' show ChangeNotifier, FlutterError, PlatformDispatcher, ValueListenable;
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:flutter/widgets.dart' show WidgetsBinding, WidgetsFlutterBinding;

import '../../utills/error_utill.dart';
import '../widgets/dependencies.dart';
import 'initialize_dependencies.dart';

typedef InitializationProgressTuple = ({int progress, String message});

abstract interface class InitializationProgressListenable implements ValueListenable<InitializationProgressTuple> {}

class InitializationExecutor with ChangeNotifier, InitializeDependencies implements InitializationProgressListenable {
  InitializationExecutor();

  Future<Dependencies>? _$currentInitialization;

  @override
  InitializationProgressTuple get value => _value;
  InitializationProgressTuple _value = (progress: 0, message: '');

  Future<Dependencies> call({
    bool deferFirstFrame = true,
    List<DeviceOrientation>? orientations,
    void Function(int progress, String message)? onProgress,
    void Function(Dependencies dependencies)? onSuccess,
    void Function(Object error, StackTrace stackTrace)? onError,
  }) =>
      _$currentInitialization ??= Future<Dependencies>(
            () async {
          late final WidgetsBinding binding;
          // start timer
          final stopwatch = Stopwatch()..start();

          // showing app initialization progress
          void notifyProgress(int progress, String message) {
            _value = (progress: progress.clamp(0, 100), message: message);
            onProgress?.call(_value.progress, _value.message);
            notifyListeners();
          }

          notifyProgress(0, 'Initializing');

          try {
            binding = WidgetsFlutterBinding.ensureInitialized();
            // don't close app splash screen
            if (deferFirstFrame) binding.deferFirstFrame();

            await _catchExceptions();

            if (orientations != null) {
              await SystemChrome.setPreferredOrientations(orientations);
            }

            final dependencies = await $initializeDependencies(
              onProgress: notifyProgress,
            ).timeout(const Duration(minutes: 5));
            notifyProgress(100, 'Done');

            onSuccess?.call(dependencies);

            return dependencies;
          } on Object catch (error, stackTrace) {
            onError?.call(error, stackTrace);
            ErrorUtil.logError(
              error,
              stackTrace,
              hint: 'Failed to initialize app',
            ).ignore();
            rethrow;
          } finally {
            stopwatch.stop();

            binding.addPostFrameCallback((_) {
              // Closes splash screen, and show the app layout.
              if (deferFirstFrame) binding.allowFirstFrame();
            });

            _$currentInitialization = null;
          }
        },
      );

  Future<void> _catchExceptions() async {
    try {
      PlatformDispatcher.instance.onError = (error, stackTrace) {
        ErrorUtil.logError(
          error,
          stackTrace,
          hint: 'ROOT | ${Error.safeToString(error)}',
        ).ignore();
        return true;
      };

      final sourceFlutterError = FlutterError.onError;
      FlutterError.onError = (final details) {
        ErrorUtil.logError(
          details.exception,
          details.stack ?? StackTrace.current,
          hint: 'FLUTTER ERROR\r\n$details',
        ).ignore();
        sourceFlutterError?.call(details);
      };
    } on Object catch (error, stackTrace) {
      ErrorUtil.logError(error, stackTrace).ignore();
    }
  }
}
