import 'package:flutter/material.dart';
import 'package:quotesapp/screens/quote_details_screen.dart';

class QuoteCard extends StatelessWidget {

  final String id;
  final String quote;
  final String person;
  final List<Color> colors;
  QuoteCard({required this.quote, required this.person, required this.colors,required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuoteDetail(id: id)));
        },
        child: Card(
          elevation: 0,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 300,
                    child: Text(
                      quote,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  SizedBox(
                    width: 300,
                    child: Text(
                      "- " + person+ " -",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
