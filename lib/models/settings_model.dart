export 'package:recipes/models/settings_model.dart';
import 'package:flutter/material.dart';

enum HomeLayout {
  tiles,
  cards,
}

class Settings {
  final HomeLayout homeLayout;

  Settings({
    @required this.homeLayout,
  });
}