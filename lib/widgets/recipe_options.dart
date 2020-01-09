export 'package:recipes/widgets/recipe_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/blocs/favorites_bloc.dart';
import 'package:recipes/models/recipe_model.dart';
import 'package:recipes/pages/edit_page.dart';

class RecipeOptions extends StatefulWidget {
  RecipeOptions(this.recipe, {Key key}) : super(key: key);

  final Recipe recipe;

  @override
  State<StatefulWidget> createState() => _RecipeOptionsState();
}

enum _Option {
  favorite,
  edit,
  share,
}

class _RecipeOptionsState extends State<RecipeOptions> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesEvent, Set<Recipe>>(
      bloc: FavoritesBloc.of(context),
      builder: (context, favorites) {
        return PopupMenuButton<_Option>(
          onSelected: _onMenuSelected,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<_Option>>[
            PopupMenuItem<_Option>(
              value: _Option.favorite,
              child: favorites.contains(widget.recipe)
                ? Text('Unfavorite')
                : Text('Favorite'),
            ),
            const PopupMenuItem<_Option>(
              value: _Option.edit,
              child: Text('Edit'),
            ),
            const PopupMenuItem<_Option>(
              value: _Option.share,
              child: Text('Share'),
            ),
          ],
        );
      }
    );
  }

  void _navigateTo(Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => widget,
      ),
    );
  }

  void _onMenuSelected(_Option option) {
    switch (option) {
      case _Option.favorite:
        FavoritesBloc.of(context).dispatch(ToggleFavoriteEvent(widget.recipe));
        break;

      case _Option.edit:
        _navigateTo(EditPage(widget.recipe));
        break;

      case _Option.share:
        // TODO
        break;
    }
  }
}