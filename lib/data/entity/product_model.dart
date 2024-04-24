import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  String name;
  int price;
  String location;
  String madeYear;
  String aboutDvigitel;
  bool isLiked;

  ProductModel({
    required this.name,
    required this.price,
    required this.location,
    required this.madeYear,
    required this.aboutDvigitel,
    required this.isLiked,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        price: json["price"],
        location: json["location"],
        madeYear: json["madeYear"],
        aboutDvigitel: json["aboutDvigitel"],
        isLiked: json["isLiked"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "location": location,
        "madeYear": madeYear,
        "aboutDvigitel": aboutDvigitel,
        "isLiked": isLiked,
      };
}

List<ProductModel> productModels = [
  ProductModel(
    name: "Bonvi 2210 elektr skuter",
    price: 3890000,
    location: "Farg'ona",
    madeYear: "2021yil",
    aboutDvigitel: "Kuchli 350 vattli dvigatel bilan",
    isLiked: false,
  ),
  ProductModel(
    name: "Honda Activa 6G",
    price: 8730000,
    location: "Toshkent",
    madeYear: "2023yil",
    aboutDvigitel: "Kuchli 420 vattli dvigatel bilan",
    isLiked: false,
  ),
  ProductModel(
    name: "TVS NTORQ 125",
    price: 5730000,
    location: "Namangan",
    madeYear: "2022yil",
    aboutDvigitel: "Kuchli 380 vattli dvigatel bilan",
    isLiked: false,
  ),
];
