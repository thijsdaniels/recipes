export 'package:recipes/widgets/recipe_card.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe_model.dart';
import 'package:recipes/pages/recipe_page.dart';

class RecipeCard extends StatelessWidget {
  RecipeCard(this.recipe, {Key key}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Column(
          children: <Widget>[
            Hero(
              tag: recipe,
              child: Image.network(
                recipe.image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    recipe.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
//                  recipe.subtitle != null
//                    ? Text(recipe.subtitle)
//                    : null,
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () => _onTapped(context),
    );
  }

  void _navigateTo(BuildContext context, Widget widget) {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => widget,
        )
    );
  }

  void _onTapped(BuildContext context) {
    _navigateTo(context, RecipePage(recipe));
  }
}
