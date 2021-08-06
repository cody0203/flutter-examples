import 'package:flutter/material.dart';
import 'package:mijia_store/src/presentation/widgets/category/fruit_products.dart';
import 'package:mijia_store/src/presentation/widgets/category/vegetable_products.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.only(left: 24, right: 30, top: 23),
        width: double.infinity,
        child: Column(
          children: const <Widget>[
            VegetableProducts(),
            FruitProducts(),
          ],
        ),
      ),
    );
  }
}
