export 'package:recipes/experiments/listenable_experiment.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CounterStore {
  static final CounterStore _instance = new CounterStore._internal();

  factory CounterStore() {
    return _instance;
  }

  CounterStore._internal();

  final ValueNotifier<int> number = new ValueNotifier(0);
}

class CounterPage extends StatelessWidget {
  final counterStore = CounterStore();

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
  final counterStore = CounterStore();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Increment'),
      onPressed: () {
        counterStore.number.value++;
      },
    );
  }
}

class CounterDisplay extends StatelessWidget {
  final counterStore = CounterStore();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: counterStore.number,
        builder: (context, value, child) => Text(counterStore.number.value.toString())
    );
  }
}