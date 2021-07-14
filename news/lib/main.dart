import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/config/themes/app_themes.dart';

import 'src/config/routes/app_routes.dart';

import './injector.dart';
import 'src/presentation/blocs/articles_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticlesBloc>(
      create: (BuildContext _) => injector()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter news',
        theme: AppTheme().light,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
