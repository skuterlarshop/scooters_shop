import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/service/local/app_storage.dart';
import '../../../data/entity/confirm_code_model.dart';
import '../../../data/entity/userModel.dart';
import '../../../data/repository/app_repository.dart';
import '../../../data/repository/app_repository_implementation.dart';

class AuthState {
  final bool isLoading;
  final String? responseMessage;
  final String? token;
  final int? pressedButtonIndex; // Add the index of the pressed button

  AuthState({
    required this.isLoading,
    this.responseMessage,
    this.token,
    this.pressedButtonIndex, // Set default value to null
  });

  AuthState copyWith({
    bool? isLoading,
    String? responseMessage,
    String? token,
    int? pressedButtonIndex, // Add this to copyWith method
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      responseMessage: responseMessage ?? this.responseMessage,
      token: token ?? this.token,
      pressedButtonIndex: pressedButtonIndex ?? this.pressedButtonIndex, // Add this line
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  AuthController(this.appRepository) : super(AuthState(isLoading: false));

  final AppRepository appRepository;

// Method to set the pressed button index
  void setPressedButtonIndex(int index) {
    state = state.copyWith(pressedButtonIndex: index);
  }

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
