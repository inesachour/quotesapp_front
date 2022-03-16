import 'package:flutter/material.dart';
import 'package:quotesapp/screens/quotes_display_screen.dart';

class CategoryCard extends StatelessWidget {

  final String title;
  final IconData icon;
  final List<Color> colors;
  CategoryCard({Key? key,required this.title, required this.icon, required this.colors});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuotesDisplay(name: title.toLowerCase())));
        },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 30,) ,
              SizedBox(height: 15,),
              Text(title, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
            ],
          ),
        ),
      ),
    );
  }
}
