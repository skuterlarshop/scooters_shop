import 'dart:convert';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  final String name;
  final String image;
  final int count;
  final String color;
  final bool shopOrUSer;
  final int price;
  final int discountPrice;

  CartModel({
    required this.name,
    required this.image,
    required this.count,
    required this.color,
    required this.shopOrUSer,
    required this.price,
    required this.discountPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        name: json["name"],
        image: json["image"],
        count: json["count"],
        color: json["color"],
        shopOrUSer: json["shopOrUSer"],
        price: json["price"],
        discountPrice: json["discountPrice"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "count": count,
        "color": color,
        "shopOrUSer": shopOrUSer,
        "price": price,
        "discountPrice": discountPrice,
      };
}

List<CartModel> cartModels = [
  CartModel(
    name: "Elektr skuter 2137 kg",
    image: "assets/images/product_image.png",
    count: 1,
    color: "Oq",
    shopOrUSer: true,
    price: 12367111,
    discountPrice: 5190000,
  ),
];
