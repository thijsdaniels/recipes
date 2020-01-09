export 'package:recipes/blocs/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/models/settings_model.dart';

class SettingsBloc extends Bloc<SettingsEvent, Settings> {
  static SettingsBloc of(BuildContext context) {
    return BlocProvider.of<SettingsBloc>(context);
  }

  @override
  Settings get initialState => Settings(
    homeLayout: HomeLayout.tiles,
  );

  @override
  Stream<Settings> mapEventToState(SettingsEvent event) async* {
    switch (event.runtimeType) {
      case HomeLayoutEvent:
        yield _setHomeLayout(event);
        break;
    }
  }

  Settings _setHomeLayout(HomeLayoutEvent event) {
    return Settings(
      homeLayout: event.homeLayout,
    );
  }
}

abstract class SettingsEvent {}

class HomeLayoutEvent extends SettingsEvent {
  final HomeLayout homeLayout;

  HomeLayoutEvent(this.homeLayout);
}
