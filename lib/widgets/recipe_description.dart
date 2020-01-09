export 'package:recipes/widgets/recipe_description.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe_model.dart';

class RecipeDescription extends StatelessWidget {
  final Recipe recipe;

  RecipeDescription({
    @required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Hero(
          tag: recipe,
          child: Image.network(
            recipe.image,
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              recipe.subtitle != null ? Container(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  recipe.subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ) : null,
              recipe.description != null ? Container(
                padding: const EdgeInsets.only(top: 16),
                child: Text(recipe.description),
              ) : null,
            ]
              .where((widget) => widget != null)
              .toList(),
          ),
        ),
      ],
    );
  }
}