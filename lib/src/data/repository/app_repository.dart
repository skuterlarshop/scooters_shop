
import 'package:skuterlar_shop/src/data/entity/productRequestModel.dart';

import '../entity/loginUser.dart';

abstract class AppRepository{

  Future<List<ProductRequestModel>>getProductList();

  Future<String?>getPosts();


  Future<LoginUser?>loginUser({required String phoneNumber});
}

