import 'package:belajar_bloc/bloc/AppBloc.dart';
import 'package:belajar_bloc/bloc/BlocProvider.dart';
import 'package:belajar_bloc/screens/PageOne.dart';
import 'package:belajar_bloc/screens/PageTwo.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    print(error);
  }
}

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  // final CounterBloc _counterBloc = CounterBloc();
  final AppBloc bloc = AppBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProviderApp(
      bloc: bloc,
      child: MaterialApp(
          title: 'Demo',
          home: PageOne(),
          routes: <String, WidgetBuilder>{
            '/screen1': (BuildContext context) => PageTwo()
          }),
    );
  }

  @override
  void dispose() {
    bloc.counterBloc.dispose();
    // bloc.dispose();
    super.dispose();
  }
}
