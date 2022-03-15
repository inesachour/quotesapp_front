import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quotesapp/models/quote.dart';

class BackendManager{

  Future<QuotesModel> getQuotes() async {
    var client = http.Client();
    var quotesModel = QuotesModel(quotes: []);

    try{
      var response = await client.get(Uri.parse('http://192.168.0.103:3000/quote'));

        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        quotesModel = QuotesModel.fromJson(jsonMap);

    }
    catch(Exception){
    }
    return quotesModel;
  }



}
