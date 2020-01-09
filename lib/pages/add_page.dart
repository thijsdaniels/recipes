export 'package:recipes/pages/home_page.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
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