import 'package:flutter/material.dart';
import 'package:mijia_store/src/presentation/widgets/home/categories_bar.dart';
import 'package:mijia_store/src/presentation/widgets/home/header.dart';
import 'package:mijia_store/src/presentation/widgets/home/recomendation_products.dart';
import 'package:mijia_store/src/presentation/widgets/home/search_bar.dart';
import 'package:mijia_store/src/presentation/widgets/home/top_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.only(left: 24, right: 30),
        width: double.infinity,
        child: Column(
          children: const <Widget>[
            HomeHeader(
              key: ValueKey<String>('HomeHeader'),
            ),
            SizedBox(height: 19),
            SearchBar(
              key: ValueKey<String>('SearchBar'),
            ),
            SizedBox(height: 10),
            CategoriesBar(),
            SizedBox(height: 8),
            TopProducts(),
            RecomendationProducts(),
          ],
        ),
      ),
    );
  }
}
