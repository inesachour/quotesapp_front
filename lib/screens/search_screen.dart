import 'package:flutter/material.dart';
import 'package:quotesapp/custom_widgets/category_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> categories = [
      CategoryCard(title: "Friendship",icon : Icons.people, colors: [Colors.blue,Colors.indigoAccent],),
      CategoryCard(title: "Love",icon : Icons.backpack, colors: [Colors.red,Colors.orange],),
      CategoryCard(title: "Family",icon : Icons.add_a_photo, colors: [Colors.green,Colors.greenAccent],),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text("Categories", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 24),),
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
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Color(0xffefeef0),
                  )
                ),
              ),
            ),

            Text("Big category"),

            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                ),
                itemBuilder: (BuildContext context, int index){
                  return categories[index];
                  },
              ),
            ),
          ],
        ),
      )
    );
  }
}
