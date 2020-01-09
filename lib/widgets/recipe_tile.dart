export 'package:recipes/widgets/recipe_tile.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe_model.dart';
import 'package:recipes/pages/recipe_page.dart';
import 'package:recipes/widgets/recipe_options.dart';

class RecipeTile extends StatelessWidget {
  RecipeTile(this.recipe, {Key key}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Hero(
          tag: recipe,
          child: Image.network(
            recipe.image,
            width: 72,
            height: 72,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          recipe.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: recipe.subtitle != null ? Text(
          recipe.subtitle,
          style: TextStyle(
            fontSize: 12,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ) : null,
        trailing: RecipeOptions(recipe),
        onTap: () => _onTap(context),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => widget,
      )
    );
  }

  void _onTap(BuildContext context) {
    _navigateTo(context, RecipePage(recipe));
  }
}