// ignore_for_file: use_build_context_synchronously, unnecessary_string_interpolations

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skuterlar_shop/src/data/entity/confirm_code_model.dart';
import 'package:skuterlar_shop/src/data/entity/userModel.dart';
import '../../core/service/api/api.dart';
import 'app_repository.dart';

@immutable
final class AppRepositoryImpl implements AppRepository {
  static const AppRepositoryImpl _impl = AppRepositoryImpl._internal();

  const AppRepositoryImpl._internal();

  factory AppRepositoryImpl() => _impl;

  @override
  Future<String?> registerUser(UserModel user) async {
    const String api =
        'http://scooterelon.uz:3636/ClientAuth/Register/RegisterNumber'; // Replace with your actual API endpoint
    final Map<String, dynamic> data = user.toJson();

    try {
      final String? response = await ApiService.post(api, data);
      return response;
    } on DioException catch (e) {
      // Handle Dio-specific errors
      print('DioError: ${e.response}');
      return null;
    } catch (e) {
      // Handle other errors
      print('Error: $e');
      return null;
    }
  }

  @override
  Future<String?> verifyUser(ConfirmCodeModel confirmCodeModel) async {
    const String api =
        'http://scooterelon.uz:3636/ClientAuth/ConfirmCode/ConfirmCode';
    final Map<String, dynamic> data = confirmCodeModel.toJson();

    try {
      final String? response = await ApiService.post(api, data);
      return response;
    } on DioError catch (e) {
      print('DioError: ${e.response}');
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
