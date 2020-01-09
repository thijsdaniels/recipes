export 'package:recipes/pages/recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/blocs/favorites_bloc.dart';
import 'package:recipes/models/recipe_model.dart';
import 'package:recipes/pages/edit_page.dart';
import 'package:recipes/widgets/recipe_description.dart';
import 'package:recipes/widgets/recipe_directions.dart';
import 'package:recipes/widgets/recipe_options.dart';
import 'package:recipes/widgets/recipe_requirements.dart';
import 'package:recipes/widgets/recipe_steps.dart';

class RecipePage extends StatefulWidget {
  RecipePage(this.recipe, {Key key}) : super(key: key);

  final Recipe recipe;

  @override
  State<StatefulWidget> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(widget.recipe.title),
      actions: <Widget>[
        BlocBuilder<FavoritesEvent, Set<Recipe>>(
          bloc: FavoritesBloc.of(context),
          builder: (context, favorites) {
            return IconButton(
              icon: Icon(
                favorites.contains(widget.recipe)
                  ? Icons.favorite
                  : Icons.favorite_border
              ),
              onPressed: _onFavoritePressed,
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: _onEditPressed,
        ),
        RecipeOptions(widget.recipe),
      ],
      bottom: TabBar(
        isScrollable: true,
        tabs: <Widget>[
          Tab(text: 'Description'),
          Tab(text: 'Ingredients'),
          Tab(text: 'Directions'),
          Tab(text: 'Steps'),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return TabBarView(
      children: <Widget>[
        RecipeDescription(recipe: widget.recipe),
        RecipeRequirements(recipe: widget.recipe),
        RecipeDirections(recipe: widget.recipe),
        RecipeSteps(recipe: widget.recipe),
      ],
    );
  }

  void _navigateTo(Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => widget,
      ),
    );
  }

  void _onFavoritePressed() {
    FavoritesBloc.of(context).dispatch(ToggleFavoriteEvent(widget.recipe));
  }

  void _onEditPressed() {
    _navigateTo(EditPage(widget.recipe));
  }
}