



// To parse this JSON data, do
//
//     final coffee = coffeeFromJson(jsonString);

import 'dart:convert';

List<CoffeeModels> coffeeFromJson(String str) => List<CoffeeModels>.from(json.decode(str).map((x) => CoffeeModels.fromJson(x)));

String coffeeToJson(List<CoffeeModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoffeeModels {
  CoffeeModels({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.image,
    required this.id,
  });

  String title;
  String description;
  List<String> ingredients;
  String image;
  int id;

  factory CoffeeModels.fromJson(Map<String, dynamic> json) => CoffeeModels(
    title: json["title"],
    description: json["description"],
    ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    image: json["image"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
    "image": image,
    "id": id,
  };
}
