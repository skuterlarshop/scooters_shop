
import 'dart:convert';

List<ProductDetailRequestModel> productDetailRequestModelFromJson(String str) => List<ProductDetailRequestModel>.from(
    json.decode(str).map((x) => ProductDetailRequestModel.fromJson(x)));

String productDetailRequestModelToJson(List<ProductDetailRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDetailRequestModel {
  final String id;
  final String model;
  final String madeYear;
  final int productCondition;
  final int batteryPower;
  final int motorPower;
  final int maxCarryingCapacity;
  final int maxSpeed;
  final int colorId;
  final int corpusId;
  final int sizeId;

  ProductDetailRequestModel({
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

  ProductDetailRequestModel copyWith({
    String? id,
    String? model,
    String? madeYear,
    int? productCondition,
    int? batteryPower,
    int? motorPower,
    int? maxCarryingCapacity,
    int? maxSpeed,
    int? colorId,
    int? corpusId,
    int? sizeId,
  }) =>
      ProductDetailRequestModel(
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

  factory ProductDetailRequestModel.fromJson(Map<String, dynamic> json) => ProductDetailRequestModel(
    id: json["id"],
    model: json["model"],
    madeYear: json["madeYear"],
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
    "madeYear": madeYear,
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

List<ProductDetailRequestModel> productDetailRequestModels = [
  ProductDetailRequestModel(id: "1", model: "Electro skuter 2131", madeYear: "2024", productCondition: 1, batteryPower: 90, motorPower: 2042, maxCarryingCapacity: 2, maxSpeed: 80, colorId: 1, corpusId: 2, sizeId: 4)
];
