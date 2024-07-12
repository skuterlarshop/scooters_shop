class ApiConstants{
  /// base url
  static const String baseUrl = "http://scooterelon.uz:3636/Address";

  /// api
  static const String apiGetDataList = "/api/post/get/all";
  static const String apiAuthLogin = "/ClientAuth/Login/Login";
  static const String apiRegisterUser = "/ClientAuth/Register/RegisterNumber";
  static const String apiConfirmCode = "/ClientAuth/ConfirmCode/ConfirmCode";
  // static const String apiSearchProduct = "/products/search";

  /// headers
  static const Map<String, String> headers = {
    "Content-Type":"application/json"
  };

  /// params
  static Map<String, Object?>paramEmpty() => const <String, Object?>{};

  static Map<String, Object?>paramSearchProduct(String text) => <String, Object?>{
    "q":text,
  };


  /// body

  static Map<String, dynamic>bodyLoginUser({required String phoneNumber}) => <String, String>{
    "phoneNumber": phoneNumber,
  };

}