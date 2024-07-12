import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:skuterlar_shop/src/core/router/router.dart";
import "../model/app_metadata.dart";

abstract interface class Dependencies {
  abstract final AppMetadata appMetadata;

  abstract final FlutterSecureStorage storage;

  abstract final AppRoute router;
}

final class $MutableDependencies implements Dependencies {
  $MutableDependencies();

  @override
  late AppMetadata appMetadata;

  @override
  late FlutterSecureStorage storage;

  @override
  late AppRoute router;
}
