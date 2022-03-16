// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(str) => List<Category>.from(str.map((x) => Category.fromJson(x)));



String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    required this.name,
  });

  String name;

  factory Category.fromJson(Map<String, dynamic> json) {
    print(json[0]);
    return Category(
    name: json["name"][0].toString().toUpperCase()+json["name"].toString().substring(1),
  );}

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

