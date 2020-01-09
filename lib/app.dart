export 'package:recipes/app.dart';
import 'package:flutter/material.dart';
import 'package:recipes/provider.dart';
import 'package:recipes/pages/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
        fontFamily: 'Product Sans',
      ),
      home: Provider(
        child: HomePage(),
      ),
    );
  }
}
