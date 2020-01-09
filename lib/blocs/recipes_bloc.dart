export 'package:recipes/blocs/recipes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/models/recipe_model.dart';

class RecipesBloc extends Bloc<RecipeEvent, List<Recipe>> {
  static RecipesBloc of(BuildContext context) {
    return BlocProvider.of<RecipesBloc>(context);
  }

  List<Recipe> get initialState => <Recipe>[
    Recipe(
      title: 'Pannekoeken met Spek',
      subtitle: 'Dutch pancakes with bacon and dark syrup.',
      image: 'https://static.ah.nl/static/recepten/img_088803_890x594_JPG.jpg',
      requirements: <Requirement>[
        Requirement(
          quantity: 400,
          unit: Units.milliliter,
          ingredient: Ingredients.milk,
        ),
        Requirement(
          quantity: 2,
          ingredient: Ingredients.egg,
        ),
        Requirement(
          quantity: 300,
          unit: Units.gram,
          ingredient: Ingredients.flour,
        ),
        Requirement(
          unit: Units.pinch,
          ingredient: Ingredients.salt,
        ),
        Requirement(
          quantity: 100,
          unit: Units.gram,
          ingredient: Ingredients.bacon,
        ),
        Requirement(
          ingredient: Ingredients.syrup,
        ),
      ],
      directions: <Direction>[
        Direction(
          title: 'Mix',
          content: 'Mix milk, eggs, flour and salt until combined.',
        ),
        Direction(
          title: 'Fry the Bacon',
          content: 'Fry 2 pieces of bacon in a frying pan until crispy.',
        ),
        Direction(
          title: 'Bake',
          content: 'Pour one ladle of batter over bacon and fry until top surface is solid.',
        ),
        Direction(
          title: 'Flip',
          content: 'Flip and bake for another minute.',
        ),
        Direction(
          title: 'Repeat',
          content: 'Remove from pan and repeat until batter is done.',
        ),
      ],
    ),
    Recipe(
      title: 'Chocolate Mug Cake',
      subtitle: 'Simple cake by the portion, ready to eat in five minutes.',
      image: 'https://sparkpeo.hs.llnwd.net/e1/resize/630m620/e2/guid/Five-Minute-Chocolate-Mug-Cake/319c313a-c9e9-4c5c-974d-d431b65a678d.jpg',
      requirements: <Requirement>[
        Requirement(
          quantity: 4,
          unit: Units.tablespoon,
          ingredient: Ingredients.flour,
        ),
        Requirement(
          quantity: 3,
          unit: Units.tablespoon,
          ingredient: Ingredients.milk,
        ),
        Requirement(
          quantity: 3,
          unit: Units.tablespoon,
          ingredient: Ingredients.sugar,
        ),
        Requirement(
          quantity: 1,
          unit: Units.tablespoon,
          ingredient: Ingredients.oil,
        ),
        Requirement(
          quantity: 1,
          unit: Units.teaspoon,
          ingredient: Ingredients.salt,
        ),
        Requirement(
          quantity: 1,
          unit: Units.teaspoon,
          ingredient: Ingredients.bakingPowder,
        ),
        Requirement(
          quantity: 1,
          unit: Units.teaspoon,
          ingredient: Ingredients.cocoaPowder,
        ),
      ],
      directions: <Direction>[
        Direction(
          title: 'Combine',
          content: 'Combine all ingredients in a mug.',
        ),
        Direction(
          title: 'Microwave',
          content: 'Microwave for 1.5 minutes at 700 watts.',
          timer: 90,
        ),
      ],
    ),
    Recipe(
      title: 'Brioche',
      subtitle: 'Fluffy and sweet enriched bread.',
      description: 'The dough of this bread is enriched with butter, sugar, milk and eggs, which makes it difficult to handle and slow to proof. Both the effort and the wait are more than worth it though!\n\nI usually prepare the dough on saturday evening, proof it in the fridge overnight and bake it on sunday morning.\n\nAsbolutely delicious with pâté, jam or nutella.',
      image: 'https://az836042.vo.msecnd.net/cache/4/a/9/7/5/7/4a97572d5d97461ce92c6b8672c44d65a142f397.jpg',
      requirements: <Requirement>[
        Requirement(
          quantity: 500,
          unit: Units.gram,
          ingredient: Ingredients.flour,
        ),
        Requirement(
          quantity: 10,
          unit: Units.gram,
          ingredient: Ingredients.yeast,
        ),
        Requirement(
          quantity: 10,
          unit: Units.gram,
          ingredient: Ingredients.salt,
        ),
        Requirement(
          quantity: 80,
          unit: Units.gram,
          ingredient: Ingredients.sugar,
        ),
        Requirement(
          quantity: 5,
          ingredient: Ingredients.egg,
        ),
        Requirement(
          quantity: 140,
          unit: Units.milliliter,
          ingredient: Ingredients.milk,
        ),
        Requirement(
          quantity: 250,
          unit: Units.gram,
          ingredient: Ingredients.butter,
        ),
      ],
      directions: <Direction>[
        Direction(
          title: 'Combine',
          content: 'Put all ingredients except the butter into the bowl of a stand mixer.',
        ),
        Direction(
          title: 'Knead',
          content: 'Knead using a dough hook attachment for 6-8 minutes.',
          timer: 8 * 60,
        ),
        Direction(
          title: 'Add the Butter',
          content: 'Add the butter, which must be at room temperature. Knead for another 4-5 minutes.',
          timer: 5 * 60,
        ),
        Direction(
          title: 'First Proofing',
          content: 'Tip into a plastic bowl, cover and place into the fridge overnight, or for at least 7 hours.',
        ),
        Direction(
          title: 'Shape the Dough',
          content: 'Place the solidified dough on a floured surface, knock out the gas and cut into three equal parts. Roll each part into a strand and braid into a loaf.',
        ),
        Direction(
          title: 'Second Proofing',
          content: 'Leave to proof for 2-3 hours.',
          timer: 2 * 60 * 60,
        ),
        Direction(
          title: 'Bake',
          content: 'Bake in the bottom right of a preheated oven at 170 degrees Celsius for 30 minutes, or until a skewer comes out clean.',
          timer: 30 * 60,
        ),
      ],
    ),
  ];

  final Set<Recipe> favorites = Set<Recipe>();

  @override
  Stream<List<Recipe>> mapEventToState(RecipeEvent event) async* {
    switch (event.runtimeType) {
      case DeleteRecipeEvent:
        yield _deleteRecipe(event);
        break;
    }
  }

  List<Recipe> _deleteRecipe(DeleteRecipeEvent event) {
    final recipes = List<Recipe>.from(currentState);
    recipes.remove(event.recipe);

    return recipes;
  }
}

abstract class RecipeEvent {}

class DeleteRecipeEvent extends RecipeEvent {
  final Recipe recipe;

  DeleteRecipeEvent(this.recipe);
}
