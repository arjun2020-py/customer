// To parse this JSON data, do
//
//     final productPage = productPageFromJson(jsonString);

import 'dart:convert';

ProductPage productPageFromJson(String str) =>
    ProductPage.fromJson(json.decode(str));

String productPageToJson(ProductPage data) => json.encode(data.toJson());

class ProductPage {
  ProductPage({
    this.image,
    this.title,
    this.discrption,
    this.price,
    this.offer,
  });

  String? image;
  String? title;
  String? discrption;
  String? price;
  String? offer;

  factory ProductPage.fromJson(Map<String, dynamic> json) => ProductPage(
        image: json["image"],
        title: json["title"],
        discrption: json["discrption"],
        price: json["price"],
        offer: json["offer"],
      );

  get length => null;

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "discrption": discrption,
        "price": price,
        "offer": offer,
      };

  elementAt(int index) {}
}
