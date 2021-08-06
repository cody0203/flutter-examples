import 'package:flutter/material.dart';

import '../../../presentation/screens/profile_screen.dart';
import 'page_builder.dart';

class ProfilePage extends PageBuilder {
  const ProfilePage()
      : super(
          page: const ProfileScreen(),
          key: const ValueKey<String>('ProfilePage'),
        );
}
