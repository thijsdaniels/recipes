export 'package:recipes/experiments/scoped_model_experiment.dart';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  int _counter = 0;

  get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel<CounterModel>(
        model: CounterModel(),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CounterButton(),
              CounterDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, child, model) => RaisedButton(
        child: Text('Increment'),
        onPressed: () => model.counter++,
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, child, model) => Text('${model.counter}'),
    );
  }
}