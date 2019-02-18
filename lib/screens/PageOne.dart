import 'package:belajar_bloc/bloc/BlocProvider.dart';
import 'package:belajar_bloc/bloc/CounterBloc.dart';
import 'package:belajar_bloc/event/CounterEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageOne extends StatelessWidget {
  void onPressButton(BuildContext context) {
    Navigator.of(context).pushNamed('/screen1');
  }

  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProviderApp.of(context).counterBloc;

    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Container(
          height: 400.0,
          width: 400.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BlocBuilder<CounterEvent, int>(
                  bloc: _counterBloc,
                  builder: (BuildContext context, int count) {
                    return Text(
                      '$count',
                      style: TextStyle(fontSize: 24.0),
                    );
                  }),
              RaisedButton(
                onPressed: () {
                  this.onPressButton(context);
                },
                child: Text('NewPage'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "btn1",
              child: Icon(Icons.add),
              onPressed: () {
                _counterBloc.dispatch(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "btn2",
              child: Icon(Icons.remove),
              onPressed: () {
                _counterBloc.dispatch(CounterEvent.decrement);
              },
            ),
          ),
        ],
      ),
    );
  }
}
