import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotesapp/models/quote.dart';
import 'package:quotesapp/services/backend_manager.dart';
import 'package:share_plus/share_plus.dart';

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
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                                  Text(
                                    "' "+ snapshot.data!.quote + " '",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 38, color: Colors.white),
                                  ),
                                  SizedBox(height: 30,),
                                  Text(
                                    "- "+snapshot.data!.person+ " -",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20, color: Colors.white),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                                ],
                              ),
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
            selectedLabelStyle: TextStyle(
              color: Colors.white
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.white,
            ),
            items: [
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
                  label: "",
              ),
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Icons.share, color: Colors.white,),
                    onPressed: (){Share.share(_quotetxt ?? "Sorry");},
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
