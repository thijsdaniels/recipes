export 'package:recipes/widgets/recipe_directions.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe_model.dart';

class RecipeDirections extends StatelessWidget {
  final Recipe recipe;

  RecipeDirections({
    @required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        children: recipe.directions.map((Direction direction) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  child: Text(
                    '${recipe.directions.indexOf(direction) + 1}',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 16, top: 4),
                    child: Text(direction.content),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}