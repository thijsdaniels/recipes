export 'package:recipes/widgets/recipes.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe_model.dart';
import 'package:recipes/models/settings_model.dart';
import 'package:recipes/widgets/recipe_card.dart';
import 'package:recipes/widgets/recipe_tile.dart';

class Recipes extends StatelessWidget {
  final Iterable<Recipe> recipes;
  final HomeLayout layout;

  Recipes({
    @required this.recipes,
    this.layout = HomeLayout.tiles,
  });

  @override
  Widget build(BuildContext context) {
    switch (layout) {
      case HomeLayout.tiles:
        return _buildRecipeTiles(context, recipes);

      case HomeLayout.cards:
        return _buildRecipeCards(recipes);
    }
  }

  Widget _buildRecipeTiles(BuildContext context, Iterable<Recipe> recipes) {
    final List<Widget> tiles = recipes
      .map((Recipe recipe) => RecipeTile(recipe))
      .toList();

    final List<Widget> divided = ListTile
      .divideTiles(tiles: tiles, context: context)
      .toList();

    return ListView(children: divided);
  }

  Widget _buildRecipeCards(Iterable<Recipe> recipes) {
    final List<Widget> cards = recipes
      .map((Recipe recipe) => RecipeCard(recipe))
      .toList();

    return GridView.count(
      padding: EdgeInsets.all(8),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      crossAxisCount: 2,
      children: cards,
    );
  }
}