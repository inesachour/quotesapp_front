// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';


QuotesModel QuotesModelFromJson(String str) => QuotesModel.fromJson(json.decode(str));

String quotesModelToJson(QuotesModel data) => json.encode(data.toJson());

class QuotesModel {
  QuotesModel({
    required this.quotes,
  });

  List<Quote> quotes;

  factory QuotesModel.fromJson(List json) => QuotesModel(  //TODO fix temporary
    quotes: List<Quote>.from(
        json.map((x) => Quote.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "quotes": List<dynamic>.from(quotes.map((x) => x.toJson())),
  };
}

class Quote {
  Quote({
    required this.id,
    required this.quote,
    required this.person,
    required this.category,
  });

  String id;
  String quote;
  String person;
  String category;


  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    id: json["id"] ?? json["_id"],
    quote: json["quote"],
    person: json["person"],
    category: json["category"],
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "quote": quote,
    "person": person,
    "category": category,
  };
}



