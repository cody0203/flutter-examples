import '../../../core/enums/category.dart';

class Categories {
  final Map<CategoryEnum, Map<String, String>> mappingCategory = {
    CategoryEnum.vegetables: <String, String>{
      'name': 'Vegetables',
      'icon': 'assets/images/vegetables_icon.png',
    },
    CategoryEnum.fish: <String, String>{
      'name': 'Vegetables',
      'icon': 'assets/images/fish_icon.png',
    },
    CategoryEnum.egg: <String, String>{
      'name': 'Egg',
      'icon': 'assets/images/egg_icon.png',
    },
    CategoryEnum.fruit: <String, String>{
      'name': 'Fruit',
      'icon': '',
    },
    CategoryEnum.recomendation: <String, String>{
      'name': 'Recomendation',
      'icon': '',
    },
    CategoryEnum.topProducts: <String, String>{
      'name': 'Top Products',
      'icon': '',
    },
  };

  final List<Map<String, String>> homeCategoriesBar = <Map<String, String>>[
    <String, String>{
      'name': 'All',
    },
    <String, String>{
      'name': 'Vegetables',
      'icon': 'assets/images/vegetables_icon.png',
    },
    <String, String>{
      'name': 'Fish',
      'icon': 'assets/images/fish_icon.png',
    },
    <String, String>{
      'name': 'Egg',
      'icon': 'assets/images/egg_icon.png',
    },
    <String, String>{
      'name': 'All',
    },
    <String, String>{
      'name': 'Vegetables',
      'icon': 'assets/images/vegetables_icon.png',
    },
    <String, String>{
      'name': 'Fish',
      'icon': 'assets/images/fish_icon.png',
    },
    <String, String>{
      'name': 'Egg',
      'icon': 'assets/images/egg_icon.png',
    },
  ];
}
