import 'package:flutter/material.dart';
import 'package:quotesapp/custom_widgets/quote_card.dart';
import 'package:quotesapp/models/quote.dart';
import 'package:quotesapp/services/backend_manager.dart';

class QuotesDisplay extends StatefulWidget {

  final String name;
  final String icon;
  final String image;
  final colors;

  const QuotesDisplay({required this.name,required this.image,required this.icon,required this.colors});

  @override
  _QuotesDisplayState createState() => _QuotesDisplayState();
}

class _QuotesDisplayState extends State<QuotesDisplay> {

  final _searchController = TextEditingController();
  late Future<QuotesModel> _quotesModel;

  void getQuotes(String search){
    var backendManager = BackendManager();
    _quotesModel = backendManager.getQuotes(widget.name,search);
  }

  @override
  void initState(){
    getQuotes("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Icon(Icons.arrow_back,color: Colors.black,),
          onTap: (){Navigator.of(context).pop();},
        ),
        title: Text("Quotes of "+ widget.name, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 24),),
        centerTitle: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
          ),
        ),
        shadowColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:25 ,horizontal:20 ),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(Icons.cancel, color: Colors.grey,),
                    onPressed: (){
                      _searchController.clear();
                      setState(() {
                        getQuotes("");
                      });
                    }
                ),
                prefixIcon: Icon(Icons.search,color: Colors.grey,),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              onChanged: (text){
                setState(() {
                  getQuotes(text);
                });
              },
            ),

            SizedBox(height: 10,),

            Expanded(
              child: FutureBuilder<QuotesModel>(
                future: _quotesModel,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return snapshot.data!.quotes.length < 1 ? Text("Nothing found"): ListView.builder(
                        itemCount: snapshot.data!.quotes.length,
                        itemBuilder: ( BuildContext context,int index){
                          var quote = snapshot.data!.quotes[index];
                          return QuoteCard(quote: quote.quote, person: quote.person, colors: widget.colors,id: quote.id,image: widget.image,);
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
