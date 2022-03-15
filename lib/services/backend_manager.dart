import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quotesapp/models/quote.dart';

class BackendManager{

  Future<QuotesModel> getQuotes(String category) async {
    var client = http.Client();
    var quotesModel = QuotesModel(quotes: []);

    try{
      var response = await client.get(Uri.parse('http://192.168.0.103:3000/quote/'+category));
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
      var response = await client.get(Uri.parse('http://192.168.0.103:3000/quote/detail/'+id));
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      print(jsonString);
      quote = Quote.fromJson(jsonMap);
      print("ok");
      print(quote);
    }
    catch(Exception){}
    return quote;
  }

}
