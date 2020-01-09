export 'package:recipes/experiments/observable_experiment.dart';

import 'package:flutter/material.dart';
import 'package:observable/observable.dart';

class CounterStore {
  static final CounterStore _instance = new CounterStore._internal();

  factory CounterStore() {
    return _instance;
  }

  CounterStore._internal();

  final ObservableList<int> list = ObservableList<int>(0);
}

class CounterPage extends StatelessWidget {
  final observableStore = CounterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CounterButton(),
            CounterDisplay(),
          ],
        ),
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  final observableStore = CounterStore();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Increment'),
      onPressed: () {
        observableStore.list.add(0);
      },
    );
  }
}

class CounterDisplay extends StatelessWidget {
  final observableStore = CounterStore();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: observableStore.list.changes,
      builder: (context, snapshot) => Text(snapshot.data.toString()),
    );
  }
}