import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../views/notification_screen.dart';
import 'app_bar_action_icon.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String title;
  final List<Widget>? actions;
  final String? currentRoute;

  MainAppBar({
    required this.title,
    this.actions,
    this.currentRoute,
  }) : preferredSize = Size.fromHeight(kToolbarHeight);

  List<Widget> _buildActions(BuildContext context) {
    if (actions != null && actions!.isNotEmpty) {
      return actions!;
    }

    return [
      AppBarActionIcon(
        icon: 'assets/images/notification_icon.svg',
        onTap: () {
          Navigator.of(context).pushReplacementNamed(
            NotificationScreen.routeName,
            arguments: currentRoute,
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 49,
      leading: Container(
        margin: const EdgeInsets.only(left: 28),
        child: GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/images/setting_icon.svg',
          ),
        ),
      ),
      title: Center(
        child: Text(
          title.toUpperCase(),
        ),
      ),
      actions: <Widget>[
        ..._buildActions(context),
      ],
    );
  }
}
