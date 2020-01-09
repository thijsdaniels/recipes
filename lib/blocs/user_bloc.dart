export 'package:recipes/blocs/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/models/user_model.dart';

class UserBloc extends Bloc<UserEvent, User> {
  static UserBloc of(BuildContext context) {
    return BlocProvider.of<UserBloc>(context);
  }

  User get initialState => User(
    name: 'Thijs Daniels',
    email: 'thijsdaniels89@gmail.com',
  );

  @override
  Stream<User> mapEventToState(UserEvent event) async* {
    yield currentState;
  }
}

abstract class UserEvent {}