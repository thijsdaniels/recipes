export 'package:recipes/widgets/recipe_requirements.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe_model.dart';

class RecipeRequirements extends StatefulWidget {
  final Recipe recipe;

  RecipeRequirements({
    @required this.recipe,
  });

  @override
  State<StatefulWidget> createState() => _RecipeRequirementsState();
}

class _RecipeRequirementsState extends State<RecipeRequirements> {
  Set<Requirement> _checkedRequirements = Set<Requirement>();

  @override
  Widget build(BuildContext context) {
    final List<Widget> tiles = widget.recipe.requirements
      .map((Requirement requirement) => _buildRequirementTile(requirement))
      .toList();

    final List<Widget> divided = ListTile
      .divideTiles(tiles: tiles, context: context)
      .toList();

    return ListView(
      children: divided,
    );
  }

  Widget _buildRequirementTile(Requirement requirement) {
    return ListTile(
      title: Text(
        [
          requirement.quantity,
          requirement.unit?.symbol,
          requirement.ingredient.name,
        ]
          .where((Object value) => value != null)
          .join(' '),
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      leading: Checkbox(
        value: _checkedRequirements.contains(requirement),
      ),
      onTap: () => setState(() {
        _checkedRequirements.contains(requirement)
          ? _checkedRequirements.remove(requirement)
          : _checkedRequirements.add(requirement);
      }),
    );
  }
}