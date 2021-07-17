import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  MainAppBar()
      : preferredSize = Size.fromHeight(kToolbarHeight + 20),
        super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100,
      leading: const SizedBox(
        width: 75,
        height: 64,
        child: Image(
          image: AssetImage('assets/images/logo_black.png'),
        ),
      ),
      title: Container(
        height: kToolbarHeight - 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 12,
                    height: 12,
                    child: Image(
                      image: AssetImage('assets/images/vietnam.png'),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text('VI')
                ],
              ),
            ),
            SizedBox(width: 27),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 12,
                    height: 12,
                    child: Image(
                      image: AssetImage('assets/images/worldwide.png'),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text('EN')
                ],
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.menu_outlined,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
