import 'package:flutter/material.dart';

import '../../../presentation/screens/category_screen.dart';
import 'page_builder.dart';

class CategoryPage extends PageBuilder {
  const CategoryPage()
      : super(
          page: const CategoryScreen(),
          key: const ValueKey<String>('CategoryPage'),
        );
}
