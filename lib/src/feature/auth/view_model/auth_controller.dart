import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:skuterlar_shop/src/data/repository/app_repository_implementation.dart';

import '../../../core/storage/app_storage.dart';
import '../../../data/entity/loginUser.dart';

class AuthController with ChangeNotifier {
  TextEditingController phoneNumber = TextEditingController();
  AppRepositoryImpl appRepositoryImpl = AppRepositoryImpl();
  LoginUser? loginUser;


  Future<void>loginUserFunction()async{

    loginUser = await appRepositoryImpl.loginUser( phoneNumber: phoneNumber.text);

    if(loginUser != null){
      await AppStorage.store(key: StorageKey.accessToken, value: loginUser!.token ?? "");
      await AppStorage.store(key: StorageKey.refreshToken, value: loginUser!.refreshToken ?? "");
      log(loginUser!.token.toString());
      log(loginUser!.refreshToken.toString());
    }

  }
}

