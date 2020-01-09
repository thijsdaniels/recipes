export 'package:recipes/provider.dart';
import 'package:flutter/material.dart';
import 'package:recipes/blocs/favorites_bloc.dart';
import 'package:recipes/blocs/recipes_bloc.dart';
import 'package:recipes/blocs/settings_bloc.dart';
import 'package:recipes/blocs/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Provider extends StatelessWidget {
  Provider({this.child, ValueKey key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: <BlocProvider>[
        BlocProvider<UserBloc>(bloc: UserBloc()),
        BlocProvider<SettingsBloc>(bloc: SettingsBloc()),
        BlocProvider<RecipesBloc>(bloc: RecipesBloc()),
        BlocProvider<FavoritesBloc>(bloc: FavoritesBloc()),
      ],
      child: child,
    );
  }
}