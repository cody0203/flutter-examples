import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app_bloc_observer.dart';
import 'package:pokedex/src/app.dart';
import './src/injector.dart' as di;

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}
