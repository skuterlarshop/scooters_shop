import 'package:skuterlar_shop/src/data/entity/confirm_code_model.dart';

import '../entity/userModel.dart';

abstract class AppRepository {
  Future<String?> registerUser(UserModel user);
  Future<String?> verifyUser(ConfirmCodeModel confirmModel);
}
