export 'package:recipes/models/recipe_model.dart';
import 'package:flutter/material.dart';

class Recipe {
  const Recipe({
    @required this.title,
    this.subtitle,
    this.description,
    this.image = 'https://placehold.it/512x256',
    @required this.requirements,
    this.directions = const [],
  });

  final String image;
  final String title;
  final String subtitle;
  final String description;
  final List<Requirement> requirements;
  final List<Direction> directions;
}

class Requirement {
  const Requirement({
    this.quantity,
    this.unit,
    @required this.ingredient,
  });

  final num quantity;
  final Unit unit;
  final Ingredient ingredient;
}

class Unit {
  const Unit(this.name, this.symbol);

  final String name;
  final String symbol;
}

class Ingredient {
  const Ingredient({ this.name });

  final String name;
}

class Direction {
  const Direction({
    this.title,
    @required this.content,
    this.timer,
  });

  final String title;
  final String content;
  final int timer;
}

class Units {
  static const milligram = Unit('milligram', 'mg');
  static const gram = Unit('gram', 'g');
  static const kilogram = Unit('kilogram', 'kg');

  static const milliliter = Unit('milliliter', 'ml');
  static const deciliter = Unit('deciliter', 'dl');
  static const centiliter = Unit('centiliter', 'cl');
  static const liter = Unit('liter', 'l');

  static const pound = Unit('pound', 'lbs');
  static const ounce = Unit('ounce', 'oz');

  static const teaspoon = Unit('teaspoon', 'tsp');
  static const tablespoon = Unit('tablespoon', 'tbsp');
  static const cup = Unit('cup', 'cup');

  static const pinch = Unit('pinch', 'pinch');
}

class Ingredients {
  static const milk = Ingredient(name: 'milk');
  static const egg = Ingredient(name: 'egg');
  static const flour = Ingredient(name: 'flour');
  static const salt = Ingredient(name: 'salt');
  static const bacon = Ingredient(name: 'bacon');
  static const yeast = Ingredient(name: 'yeast');
  static const sugar = Ingredient(name: 'sugar');
  static const oil = Ingredient(name: 'oil');
  static const cocoaPowder = Ingredient(name: 'cocoa powder');
  static const bakingPowder = Ingredient(name: 'baking powder');
  static const butter = Ingredient(name: 'butter');
  static const syrup = Ingredient(name: 'syrup');
}
