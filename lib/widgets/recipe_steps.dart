export 'package:recipes/widgets/recipe_steps.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe_model.dart';

class RecipeSteps extends StatefulWidget {
  final Recipe recipe;

  RecipeSteps({
    @required this.recipe,
  });

  @override
  State<StatefulWidget> createState() => _RecipeStepsState();
}

class _RecipeStepsState extends State<RecipeSteps> {
  int _currentStepIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Direction> directions = widget.recipe.directions;

    return Stepper(
      currentStep: _currentStepIndex,
      steps: directions.map((Direction direction) {
        final int index = directions.indexOf(direction);

        return Step(
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(direction.title ?? 'Step ${index + 1}'),
              direction.timer != null
                  ? IconButton(
                icon: Icon(Icons.timer),
                onPressed: null,
              )
                  : null,
            ].where((Widget widget) => widget != null).toList(),
          ),
          content: Row(
            children: <Widget>[
              Expanded(
                child: Text(direction.content),
              ),
            ],
          ),
          isActive: index == _currentStepIndex,
          state: index < _currentStepIndex
              ? StepState.complete
              : StepState.indexed,
        );
      }).toList(),
      physics: NeverScrollableScrollPhysics(),
      onStepTapped: (int index) => setState(() => _currentStepIndex = index),
      onStepContinue: () => setState(() => _currentStepIndex = min(_currentStepIndex + 1, directions.length - 1)),
      onStepCancel: () => setState(() => _currentStepIndex = max(_currentStepIndex - 1, 0)),
    );
  }
}