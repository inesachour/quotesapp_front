import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quotesapp/constants/ip.dart';
import 'package:quotesapp/models/categories.dart';
import 'package:quotesapp/models/quote.dart';

class BackendManager{

  Future<QuotesModel> getQuotes(String category, String search) async {
    var client = http.Client();
    var quotesModel = QuotesModel(quotes: []);

    try{
      String url = 'http://'+ip+':3000/quote/'+category;
      if(search.isNotEmpty){
        url += '/'+search;
      }
      var response = await client.get(Uri.parse(url));
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      quotesModel = QuotesModel.fromJson(jsonMap);
    }
    catch(Exception){}
    return quotesModel;
  }

  Future<Quote> getQuotesById(String id) async {
    var client = http.Client();
    Quote quote = new Quote(quote: "",person: "",id: "",category: "");

    try{
      var response = await client.get(Uri.parse('http://'+ip+':3000/quote/detail/'+id));
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      quote = Quote.fromJson(jsonMap);
    }
    catch(Exception){}
    return quote;
  }

  Future<List<Category>> getCategories(String search) async {
    var client = http.Client();
    List<Category> categories = [];
    try{
      String url = 'http://'+ip+':3000/quote/categories';
      if(search.isNotEmpty){
        url += '/'+search;
      }
      var response = await client.get(Uri.parse(url));
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      categories = categoryFromJson(jsonMap);

    }
    catch(Exception){print(Exception.toString());}
    return categories;
  }
}
