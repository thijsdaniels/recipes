export 'package:recipes/experiments/scoped_model_experiment.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterState with ChangeNotifier {
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
      body: ChangeNotifierProvider<CounterState>(
        builder: (context) => CounterState(),
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
    return Consumer<CounterState>(
      builder: (context, state, child) => RaisedButton(
        child: Text('Increment'),
        onPressed: () => state.counter++,
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterState>(
      builder: (context, state, child) => Text('${state.counter}'),
    );
  }
}