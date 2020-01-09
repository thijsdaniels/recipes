export 'package:recipes/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe_model.dart';

class EditPage extends StatefulWidget {
  EditPage(this.recipe, {Key key}) : super(key: key);

  final Recipe recipe;

  @override
  State<StatefulWidget> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _onSavePressed,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container();
  }

  void _onSavePressed() {
    Navigator.of(context).pop();
  }
}