import 'package:skuterlar_shop/src/data/entity/confirm_code_model.dart';

import '../entity/productRequestModel.dart';
import '../entity/userModel.dart';

abstract class AppRepository {
  Future<String?> registerUser(UserModel user);
  Future<String?> verifyUser(ConfirmCodeModel confirmModel);
  Future<String?> postProductRequest(ProductRequestModel product);
}
