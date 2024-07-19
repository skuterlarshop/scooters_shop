class ApiConst {
  static const Duration connectionTimeout = Duration(seconds: 20000);
  static const Duration sendTimeout = Duration(seconds: 20000);

  static const String baseUrl = "http://scooterelon.uz";
  static const String version = ":3636";

  // Courses api
  static const String registerUrl = "$version/ClientAuth/Register/RegisterNumber";
}

class ApiParams {
  const ApiParams._();


  static Map<String, dynamic> cabinetSmsCheckParams({required String phone, required String code}) => <String, dynamic>{
    "phone": phone,
    "code": code,
  };

  static Map<String, dynamic> emptyParams() => <String, dynamic>{};

}
