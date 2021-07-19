import 'package:flutter/material.dart';
import 'package:online_course/presentations/widgets/notification_group_list.dart';

import '../widgets/app_bar_action_icon.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/search_input.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = '/notification';
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: MainAppBar(
        title: 'NOTIFICATION',
        actions: [
          AppBarActionIcon(
            icon: 'assets/images/config_icon.svg',
            onTap: () {
              if (routeArgs != null) {
                Navigator.of(context).pushReplacementNamed(
                  routeArgs as String,
                );
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 28),
          margin: const EdgeInsets.only(top: 25),
          child: Column(
            children: <Widget>[
              SearchInput(),
              SizedBox(height: 25),
              NotificationGroupList(),
            ],
          ),
        ),
      ),
    );
  }
}
