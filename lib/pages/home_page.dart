export 'package:recipes/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/blocs/favorites_bloc.dart';
import 'package:recipes/blocs/recipes_bloc.dart';
import 'package:recipes/blocs/settings_bloc.dart';
import 'package:recipes/models/recipe_model.dart';
import 'package:recipes/models/settings_model.dart';
import 'package:recipes/pages/add_page.dart';
import 'package:recipes/widgets/main_drawer.dart';
import 'package:recipes/widgets/recipes.dart';

enum _Tab {
  browse,
  favorites,
  search,
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        drawer: MainDrawer(),
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: _onAddPressed,
          tooltip: 'Add',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('Home'),
      bottom: TabBar(
        tabs: <Widget>[
          Tab(text: 'Recipes'),
          Tab(text: 'Favorites'),
          Tab(text: 'Search'),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return TabBarView(
      children: <Widget>[
        _buildBrowseTab(),
        _buildFavoritesTab(),
        _buildSearchTab(),
      ],
    );
  }

  Widget _buildBrowseTab() {
    return BlocBuilder<RecipeEvent, List<Recipe>>(
      bloc: RecipesBloc.of(context),
      builder: (context, recipes) => BlocBuilder<SettingsEvent, Settings>(
        bloc: SettingsBloc.of(context),
        builder: (context, settings) => Recipes(
          recipes: recipes,
          layout: settings.homeLayout,
        ),
      ),
    );
  }

  Widget _buildFavoritesTab() {
    return BlocBuilder<FavoritesEvent, Set<Recipe>>(
      bloc: FavoritesBloc.of(context),
      builder: (context, favorites) => favorites.length > 0
        ? BlocBuilder<SettingsEvent, Settings>(
          bloc: SettingsBloc.of(context),
          builder: (context, settings) => Recipes(
            recipes: favorites,
            layout: settings.homeLayout,
          ),
        )
        : Center(
          child: Text(
            'You don\'t have any favorites yet.',
            style: TextStyle(
              color: Colors.black.withAlpha(64),
            ),
          ),
      ),
    );
  }

  Widget _buildSearchTab() {
    return Container();
  }

  void _navigateTo(Widget widget) {
    Navigator
      .of(context)
      .push(MaterialPageRoute<void>(
        builder: (BuildContext context) => widget,
      ),
    );
  }

  void _onAddPressed() {
    _navigateTo(AddPage());
  }
}