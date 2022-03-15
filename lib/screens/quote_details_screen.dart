import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuoteDetail extends StatefulWidget {
  const QuoteDetail({Key? key}) : super(key: key);

  @override
  _QuoteDetailState createState() => _QuoteDetailState();
}

class _QuoteDetailState extends State<QuoteDetail> {
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
          leading: Icon(Icons.arrow_back,size: 28),
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
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "' "+"Each day do your best and go to the rest"+ " '",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 38, color: Colors.white),
                          ),
                          SizedBox(height: 30,),
                          Text(
                            "- "+"Dra chkoun"+ " -",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white),

                          ),
                        ],

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
