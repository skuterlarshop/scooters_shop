
import 'package:skuterlar_shop/src/data/entity/productRequestModel.dart';

import '../../core/server/api.dart';
import '../../core/server/api_constants.dart';
import '../entity/loginUser.dart';
import 'app_repository.dart';

class AppRepositoryImpl implements AppRepository{

  @override
  Future<List<ProductRequestModel>> getProductList() async{
    String? str = await Api.getData(api: ApiConstants.apiGetDataList, param: ApiConstants.paramEmpty());
    if(str != null){
      List<ProductRequestModel> dataList = productRequestModelFromJson(str);
      return dataList;
    }else{
      return [];
    }
  }

  @override
  Future<LoginUser?> loginUser({required String phoneNumber}) async{
    String? str = await Api.postData(api: ApiConstants.apiAuthLogin, param: ApiConstants.paramEmpty(), data: ApiConstants.bodyLoginUser(phoneNumber: phoneNumber));
    if(str != null){
      LoginUser loginUser = loginUserFromJson(str);
      return loginUser;
    }else{
      return null;
    }
  }

  @override
  Future<String?> getPosts() async{
    String? str = await Api.getData(api: ApiConstants.apiGetDataList, param: ApiConstants.paramEmpty());
    if(str != null){
      return str;
    }else{
      return null;
    }
  }




}