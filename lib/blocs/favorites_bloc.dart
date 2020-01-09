export 'package:recipes/blocs/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/models/recipe_model.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, Set<Recipe>> {
  static FavoritesBloc of(BuildContext context) {
    return BlocProvider.of<FavoritesBloc>(context);
  }

  Set<Recipe> get initialState => Set<Recipe>();

  @override
  Stream<Set<Recipe>> mapEventToState(FavoritesEvent event) async* {
    switch (event.runtimeType) {
      case ToggleFavoriteEvent:
        yield _toggleFavorite(event);
        break;
    }
  }

  Set<Recipe> _toggleFavorite(ToggleFavoriteEvent event) {
    final favorites = Set<Recipe>.from(currentState);

    favorites.contains(event.recipe)
      ? favorites.remove(event.recipe)
      : favorites.add(event.recipe);

    return favorites;
  }
}

abstract class FavoritesEvent {}

class ToggleFavoriteEvent extends FavoritesEvent {
  final Recipe recipe;

  ToggleFavoriteEvent(this.recipe);
}
