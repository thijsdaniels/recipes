export 'package:recipes/models/user_model.dart';
import 'package:flutter/material.dart';

class User {
  const User({
    @required this.name,
    @required this.email,
  });

  final String name;
  final String email;
}
