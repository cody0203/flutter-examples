import 'package:flutter/material.dart';

import '../../../presentation/screens/detail_screen.dart';
import 'page_builder.dart';

class DetailPage extends PageBuilder {
  DetailPage(int productId)
      : super(
          page: DetailScreen(productId: productId),
          key: const ValueKey<String>('DetailPage'),
        );
}
