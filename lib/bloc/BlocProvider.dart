import 'package:belajar_bloc/bloc/AppBloc.dart';
import 'package:flutter/material.dart';

class BlocProviderApp extends InheritedWidget {
  final AppBloc bloc;

  BlocProviderApp({Key key, this.bloc, child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AppBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProviderApp) as BlocProviderApp)
          .bloc;
}
