import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    this.actions,
    this.title,
  }) : super(key: key);
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
  final List<Widget>? actions;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 78,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 26),
        child: IconButton(
          padding: const EdgeInsets.symmetric(
            vertical: 7.5,
            horizontal: 13,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 27,
          ),
        ),
      ),
      title: title,
      actions: actions,
    );
  }
}
