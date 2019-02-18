import 'package:belajar_bloc/bloc/CounterBloc.dart';

class AppBloc {
  CounterBloc _counter;

  AppBloc() : _counter = CounterBloc();

  CounterBloc get counterBloc => _counter;
}
