import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuterlar_shop/src/data/entity/confirm_code_model.dart';
import 'package:skuterlar_shop/src/data/repository/app_repository_implementation.dart';

import '../../../core/service/local/app_storage.dart';
import '../../../data/entity/userModel.dart';
import '../../../data/repository/app_repository.dart';

class AuthState {
  final bool isLoading;
  final String? responseMessage;
  final String? token;

  AuthState({required this.isLoading, this.responseMessage, this.token});

  AuthState copyWith(
      {bool? isLoading, String? responseMessage, String? token}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      responseMessage: responseMessage ?? this.responseMessage,
      token: token ?? this.token,
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  AuthController(this.appRepository) : super(AuthState(isLoading: false));

  final AppRepository appRepository;

  Future<void> registerUser(UserModel user) async {
    state = state.copyWith(isLoading: true);

    try {
      final String? response = await appRepository.registerUser(user);
      state = state.copyWith(
        isLoading: false,
        responseMessage: response != null
            ? 'User registered successfully: $response'
            : 'User registration failed.',
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        responseMessage: 'User registration failed: $e',
      );
    }
  }
  Future<void> verifyUser(ConfirmCodeModel confirmCodeModel) async {
    state = state.copyWith(isLoading: true);

    try {
      final String? response = await appRepository.verifyUser(confirmCodeModel);
      if (response != null) {
        // Save the token to local storage
        await AppStorage.write(StorageKey.token, response);
        state = state.copyWith(isLoading: false, token: response);
      } else {
        state = state.copyWith(isLoading: false, responseMessage: 'Verification failed.');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, responseMessage: 'Verification failed: $e');
    }
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    return AuthController(AppRepositoryImpl());
  },
);
