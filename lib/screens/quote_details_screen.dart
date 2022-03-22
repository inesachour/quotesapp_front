import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotesapp/models/quote.dart';
import 'package:quotesapp/services/backend_manager.dart';

class QuoteDetail extends StatefulWidget {

  final String id;
  final String image;

  const QuoteDetail({required this.id,required this.image});

  @override
  _QuoteDetailState createState() => _QuoteDetailState();
}

class _QuoteDetailState extends State<QuoteDetail> {

  String? _quotetxt;
  late Future<Quote> _quote;

  var snackBar = SnackBar(
    content: Text('Quote copied successfully', textAlign: TextAlign.center,),
    backgroundColor: Colors.grey.withOpacity(0.7),
  );

  @override
  void initState() {
    var backendManager = BackendManager();
    _quote = backendManager.getQuotesById(widget.id);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              widget.image ,
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
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: Container(
            child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                      width: 400,
                      child: FutureBuilder<Quote>(
                        future: _quote,
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            _quotetxt = snapshot.data!.quote;
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
          ),
        ),

        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.grey.withOpacity(0.3),
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: Icon(Icons.star, color :Colors.white),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Icons.copy_rounded, color :Colors.white),
                    onPressed: (){
                      if(_quotetxt != null){
                        Clipboard.setData(ClipboardData(text: _quotetxt))
                            .then((value) {ScaffoldMessenger.of(context).showSnackBar(snackBar);});
                        }
                      }
                  ),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(left : 70),
                    child: Icon(Icons.share, color: Colors.white,),
              ),
                  label: "",

              ),
            ],
            iconSize: 30,

          ),
        ),


      ),
    );
  }
}
