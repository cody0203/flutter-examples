import 'package:flutter/material.dart';

import '../../../data/datasource/local/categories.dart';
import 'category_bar_item.dart';

class CategoriesBar extends StatefulWidget {
  const CategoriesBar({Key? key}) : super(key: key);
  @override
  _CategoriesBarState createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  final List<Map<String, String>> _categories = Categories().homeCategoriesBar;
  int _currentCategoryIndex = 0;

  void _onChooseCategory(int index) {
    setState(() {
      _currentCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _categories.length,
      child: TabBar(
        onTap: (int index) {
          _onChooseCategory(index);
        },
        indicatorColor: Colors.transparent,
        isScrollable: true,
        labelPadding: const EdgeInsets.all(0),
        tabs: <Widget>[
          for (int i = 0; i < _categories.length; i++)
            CategoryBarItem(
              name: _categories[i]['name'] ?? '',
              iconAsset: _categories[i]['icon'],
              onChoose: () {
                // _onChooseCategory(i);
              },
              isActive: _currentCategoryIndex == i,
              key: ValueKey<String>(_categories[i]['name']!),
            ),
        ],
      ),
    );
  }
}
