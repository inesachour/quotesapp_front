import 'package:flutter/material.dart';
import 'package:quotesapp/screens/quote_details_screen.dart';
import 'package:quotesapp/screens/quotes_display_screen.dart';
import 'package:quotesapp/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes',
      home: SearchScreen(),
    );
  }
}