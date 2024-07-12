
import 'dart:convert';
List<ProductRequestModel> productRequestModelFromJson(String str) => List<ProductRequestModel>.from(
    json.decode(str).map((x) => ProductRequestModel.fromJson(x)));

String productRequestModelToJson(List<ProductRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductRequestModel {
  final String name;
  final bool isNegotiable;
  final String phoneNumber;
  final int price;
  final String description;
  final bool isDeleted;
  ProductRequestModel? productDetail;
  final int productCategoryId;
  final String userId;
  final String imageIds;

  ProductRequestModel({
    required this.name,
    required this.isNegotiable,
    required this.phoneNumber,
    required this.price,
    required this.description,
    required this.isDeleted,
     this.productDetail,
    required this.productCategoryId,
    required this.userId,
    required this.imageIds,
  });

  ProductRequestModel copyWith({
    String? name,
    bool? isNegotiable,
    String? phoneNumber,
    int? price,
    String? description,
    bool? isDeleted,
    ProductRequestModel? productDetail,
    int? productCategoryId,
    String? userId,
    String? imageIds,
  }) =>
      ProductRequestModel(
        name: name ?? this.name,
        isNegotiable: isNegotiable ?? this.isNegotiable,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        price: price ?? this.price,
        description: description ?? this.description,
        isDeleted: isDeleted ?? this.isDeleted,
        productDetail: productDetail ?? this.productDetail,
        productCategoryId: productCategoryId ?? this.productCategoryId,
        userId: userId ?? this.userId,
        imageIds: imageIds ?? this.imageIds,
      );

  factory ProductRequestModel.fromJson(Map<String, dynamic> json) => ProductRequestModel(
    name: json["name"],
    isNegotiable: json["isNegotiable"],
    phoneNumber: json["phoneNumber"],
    price: json["price"],
    description: json["description"],
    isDeleted: json["isDeleted"],
    productDetail: json["productDetail"],
    productCategoryId: json["productCategoryId"],
    userId: json["userId"],
    imageIds: json["imageIds"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "isNegotiable": isNegotiable,
    "phoneNumber": phoneNumber,
    "price": price,
    "description": description,
    "isDeleted": isDeleted,
    "productDetail": productDetail,
    "productCategoryId": productCategoryId,
    "userId": userId,
    "imageIds": imageIds,
  };
}


List<ProductRequestModel> productModels = [
  ProductRequestModel(name: "Electr sukuter", isNegotiable: true
      , phoneNumber: "998500550502", price: 5422000, description: "Zor mazza qiladigand j jw cwfvjwecwec wecwecwec", isDeleted: true,  productCategoryId: 12, userId: "12", imageIds: "imaga url")
];