export 'package:recipes/experiments/bloc_experiment.dart';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent {
  increment,
  decrement,
}

class CounterBloc extends Bloc<CounterEvent, int> {
  static CounterBloc of(BuildContext context) {
    return BlocProvider.of<CounterBloc>(context);
  }

  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield currentState + 1;
        break;

      case CounterEvent.decrement:
        yield currentState - 1;
        break;
    }
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        bloc: CounterBloc(),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CounterButton(CounterEvent.increment),
              CounterButton(CounterEvent.decrement),
              CounterDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  CounterButton(this.event, {ValueKey key}) : super(key: key);

  final CounterEvent event;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(event.toString()),
      onPressed: () => CounterBloc.of(context).dispatch(event),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterEvent, int>(
      bloc: CounterBloc.of(context),
      builder: (context, value) => Text('$value'),
    );
  }
}