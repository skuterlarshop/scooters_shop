
import 'dart:convert';

ProductRequestModel productRequestModelFromJson(String str) => ProductRequestModel.fromJson(json.decode(str));

String productRequestModelToJson(ProductRequestModel data) => json.encode(data.toJson());

class ProductRequestModel {
  final String name;
  final bool isNegotiable;
  final String phoneNumber;
  final int price;
  final String description;
  final bool isDeleted;
  final ProductDetail productDetail;
  final int productCategoryId;
  final String userId;
  final List<String> imageIds;

  ProductRequestModel({
    required this.name,
    required this.isNegotiable,
    required this.phoneNumber,
    required this.price,
    required this.description,
    required this.isDeleted,
    required this.productDetail,
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
    ProductDetail? productDetail,
    int? productCategoryId,
    String? userId,
    List<String>? imageIds,
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
    productDetail: ProductDetail.fromJson(json["productDetail"]),
    productCategoryId: json["productCategoryId"],
    userId: json["userId"],
    imageIds: List<String>.from(json["imageIds"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "isNegotiable": isNegotiable,
    "phoneNumber": phoneNumber,
    "price": price,
    "description": description,
    "isDeleted": isDeleted,
    "productDetail": productDetail.toJson(),
    "productCategoryId": productCategoryId,
    "userId": userId,
    "imageIds": List<dynamic>.from(imageIds.map((x) => x)),
  };
}

class ProductDetail {
  final String id;
  final String model;
  final DateTime madeYear;
  final int productCondition;
  final int batteryPower;
  final int motorPower;
  final int maxCarryingCapacity;
  final int maxSpeed;
  final int colorId;
  final int corpusId;
  final int sizeId;

  ProductDetail({
    required this.id,
    required this.model,
    required this.madeYear,
    required this.productCondition,
    required this.batteryPower,
    required this.motorPower,
    required this.maxCarryingCapacity,
    required this.maxSpeed,
    required this.colorId,
    required this.corpusId,
    required this.sizeId,
  });

  ProductDetail copyWith({
    String? id,
    String? model,
    DateTime? madeYear,
    int? productCondition,
    int? batteryPower,
    int? motorPower,
    int? maxCarryingCapacity,
    int? maxSpeed,
    int? colorId,
    int? corpusId,
    int? sizeId,
  }) =>
      ProductDetail(
        id: id ?? this.id,
        model: model ?? this.model,
        madeYear: madeYear ?? this.madeYear,
        productCondition: productCondition ?? this.productCondition,
        batteryPower: batteryPower ?? this.batteryPower,
        motorPower: motorPower ?? this.motorPower,
        maxCarryingCapacity: maxCarryingCapacity ?? this.maxCarryingCapacity,
        maxSpeed: maxSpeed ?? this.maxSpeed,
        colorId: colorId ?? this.colorId,
        corpusId: corpusId ?? this.corpusId,
        sizeId: sizeId ?? this.sizeId,
      );

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    id: json["id"],
    model: json["model"],
    madeYear: DateTime.parse(json["madeYear"]),
    productCondition: json["productCondition"],
    batteryPower: json["batteryPower"],
    motorPower: json["motorPower"],
    maxCarryingCapacity: json["maxCarryingCapacity"],
    maxSpeed: json["maxSpeed"],
    colorId: json["colorId"],
    corpusId: json["corpusId"],
    sizeId: json["sizeId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model": model,
    "madeYear": madeYear.toIso8601String(),
    "productCondition": productCondition,
    "batteryPower": batteryPower,
    "motorPower": motorPower,
    "maxCarryingCapacity": maxCarryingCapacity,
    "maxSpeed": maxSpeed,
    "colorId": colorId,
    "corpusId": corpusId,
    "sizeId": sizeId,
  };
}




List<ProductRequestModel> productModels =[];
