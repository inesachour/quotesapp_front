import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotesapp/models/quote.dart';
import 'package:quotesapp/services/backend_manager.dart';

class QuoteDetail extends StatefulWidget {

  final String id;
  const QuoteDetail({required this.id});

  @override
  _QuoteDetailState createState() => _QuoteDetailState();
}

class _QuoteDetailState extends State<QuoteDetail> {


  late Future<Quote> _quote;

  @override
  void initState() {
    var backendManager = BackendManager();
    _quote = backendManager.getQuotesById(widget.id);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://www.kindacode.com/wp-content/uploads/2021/01/blue.jpg',
            ),
          ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Icon(Icons.arrow_back,size: 28),
            onTap: (){Navigator.of(context).pop();},
          ),
          actions: [
             Padding(
               padding: const EdgeInsets.only(right : 20),
               child: Icon(Icons.view_list_sharp, size: 28,),
             ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                      width: 400,
                      child: FutureBuilder<Quote>(
                        future: _quote,
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "' "+ snapshot.data!.quote + " '",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 38, color: Colors.white),
                                ),
                                SizedBox(height: 30,),
                                Text(
                                  "- "+snapshot.data!.category+ " -",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20, color: Colors.white),

                                ),
                              ],

                            );
                          }
                          else{
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      )
                  ),
                ),
                Column(
                  children: [
                    Icon(Icons.thumb_up_alt,size: 30,color :Colors.white),
                    SizedBox(height: 20,),
                    Icon(Icons.thumb_down_alt,size: 30,color :Colors.white),
                  ],
                )
              ],
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(icon: Padding(
              padding: const EdgeInsets.only(right: 70),
              child: Icon(Icons.star, color :Colors.white),
            ), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.queue_sharp, color :Colors.white), label: ""),
            BottomNavigationBarItem(icon: Padding(
              padding: const EdgeInsets.only(left : 70),
              child: Icon(Icons.share, color: Colors.white,),
            ), label: ""),
          ],
          iconSize: 30,

        ),


      ),
    );
  }
}
