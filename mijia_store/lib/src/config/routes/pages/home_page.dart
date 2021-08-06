import 'package:flutter/material.dart';

import '../../../presentation/screens/home_screen.dart';
import 'page_builder.dart';

class HomePage extends PageBuilder {
  const HomePage()
      : super(
          page: const HomeScreen(),
          key: const ValueKey<String>('HomePage'),
        );
}
