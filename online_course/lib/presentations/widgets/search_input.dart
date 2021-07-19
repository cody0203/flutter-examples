import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'text_input.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainTextInput.outline(
      label: 'Search',
      prefixIcon: SvgPicture.asset(
        'assets/images/search_icon.svg',
        width: 24,
      ),
    );
  }
}
