import 'package:flutter/material.dart';
import 'package:quotesapp/custom_widgets/quote_card.dart';

class QuotesDisplay extends StatefulWidget {
  const QuotesDisplay({Key? key}) : super(key: key);

  @override
  _QuotesDisplayState createState() => _QuotesDisplayState();
}

class _QuotesDisplayState extends State<QuotesDisplay> {

  List quotes = [
    QuoteCard(quote: "idk please be whatever fgkdfgjlkdfgml kelgjdsljg erkljgqdlgjdj lkjglgjdl", person: "me not him",colors : [Colors.blue,Colors.indigoAccent]),
    QuoteCard(quote: "idk please be whatever", person: "me not him", colors: [Colors.green,Colors.greenAccent],),
    QuoteCard(quote: "idk please be whatever", person: "me not him", colors: [Colors.green,Colors.greenAccent],),
    QuoteCard(quote: "idk please be whatever", person: "me not him", colors: [Colors.green,Colors.greenAccent],),
    QuoteCard(quote: "idk please be whatever", person: "me not him", colors: [Colors.green,Colors.greenAccent],),
    QuoteCard(quote: "idk please be whatever", person: "me not him", colors: [Colors.green,Colors.greenAccent],),
    QuoteCard(quote: "idk please be whatever", person: "me not him", colors: [Colors.green,Colors.greenAccent],),
    QuoteCard(quote: "idk please be whatever", person: "me not him", colors: [Colors.green,Colors.greenAccent],),
    QuoteCard(quote: "idk please be whatever", person: "me not him", colors: [Colors.green,Colors.greenAccent],),
    QuoteCard(quote: "idk please be whatever", person: "me not him", colors: [Colors.green,Colors.greenAccent],),
  ];

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
              child: ListView.builder(
                  itemCount: quotes.length,
                  itemBuilder: ( BuildContext context,int index){
                    return quotes[index];
                  }
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
