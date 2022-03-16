
import 'package:flutter/material.dart';
import 'package:quotesapp/constants/colors.dart';
import 'package:quotesapp/custom_widgets/category_card.dart';
import 'package:quotesapp/models/categories.dart';
import 'package:quotesapp/services/backend_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  late Future<List<Category>> _allCategories;

  @override
  void initState() {
    var backendManager = BackendManager();
    _allCategories = backendManager.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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

      body: FutureBuilder<List<Category>>(
        future: _allCategories,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data!.indexOf(snapshot.data!.last)+1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (BuildContext context, int index){
                        var category= snapshot.data!.elementAt(index);
                        return CategoryCard(title: category.name,icon: Icons.category,colors: categoriesColors[index%categoriesColors.length]);
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }
}
