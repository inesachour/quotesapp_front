import 'package:flutter/material.dart';
import 'package:quotesapp/custom_widgets/quote_card.dart';
import 'package:quotesapp/models/quote.dart';
import 'package:quotesapp/services/backend_manager.dart';

class QuotesDisplay extends StatefulWidget {
  const QuotesDisplay({Key? key}) : super(key: key);

  @override
  _QuotesDisplayState createState() => _QuotesDisplayState();
}

class _QuotesDisplayState extends State<QuotesDisplay> {

  late Future<QuotesModel> _quotesModel;

  @override
  void initState(){
    var backendManager = BackendManager();
    _quotesModel = backendManager.getQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        leading: Icon(Icons.arrow_back,color: Colors.black,),
        title: Text("Quotes", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 24),),
        centerTitle: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
          ),
        ),
        shadowColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.search, color: Colors.black,),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:25 ,horizontal:20 ),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<QuotesModel>(
                future: _quotesModel,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                        itemCount: snapshot.data!.quotes.length,
                        itemBuilder: ( BuildContext context,int index){
                          var quote = snapshot.data!.quotes[index];
                          return QuoteCard(quote: quote.quote, person: quote.person, colors: [Colors.green,Colors.greenAccent]);
                        }
                    );
                  }
                  else{
                    return Center(child: CircularProgressIndicator());
                  }

                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
