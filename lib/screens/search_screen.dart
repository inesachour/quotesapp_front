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

  final _searchController = TextEditingController();
  late Future<List<Category>> _allCategories;

  void getCategories(String search){
    var backendManager = BackendManager();
    _allCategories = backendManager.getCategories(search);
  }

  @override
  void initState() {
    getCategories("");
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
                              getCategories("");
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
                        getCategories(text);
                      });
                    },
                  ),

                  SizedBox(height: 20),

                  Expanded(
                    child: snapshot.data!.length <1 ? Text("Nothing found"): GridView.builder(
                      itemCount: snapshot.data!.indexOf(snapshot.data!.last)+1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (BuildContext context, int index){
                        var category= snapshot.data!.elementAt(index);
                        return CategoryCard(title: category.name,icon: category.icon,colors: categoriesColors[index%categoriesColors.length],image: category.image,);
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
      ),
    );
  }
}
