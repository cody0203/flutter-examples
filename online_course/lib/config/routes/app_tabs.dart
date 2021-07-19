import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../presentations/views/home_screen.dart';
import '../../presentations/views/my_course_screen.dart';
import '../../presentations/views/my_note_screen.dart';
import '../../presentations/views/profile_screen.dart';
import '../../presentations/widgets/main_app_bar.dart';

class AppTabs extends StatefulWidget {
  @override
  _AppTabsState createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _controller;
  final List<Map<String, dynamic>> _pages = [
    {
      'page': HomeScreen(),
      'title': 'Home',
      'icon': 'assets/images/home_icon.svg',
      'routeName': HomeScreen.routeName,
    },
    {
      'page': MyCourseScreen(),
      'title': 'My Course',
      'icon': 'assets/images/my_course_icon.svg',
      'routeName': MyCourseScreen.routeName,
    },
    {
      'page': MyNoteScreen(),
      'title': 'My Note',
      'icon': 'assets/images/my_note_icon.svg',
      'routeName': MyNoteScreen.routeName,
    },
    {
      'page': ProfileScreen(),
      'title': 'Profile',
      'icon': 'assets/images/user_icon.svg',
      'routeName': ProfileScreen.routeName,
    },
  ];

  @override
  void initState() {
    _controller = TabController(
      length: _pages.length,
      vsync: this,
      initialIndex: 0,
    );

    _controller.addListener(_onChangeTab);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final routeIndex =
        _pages.indexWhere((page) => page['routeName'] == currentRoute);
    setState(() {
      _currentIndex = routeIndex;
    });
    _controller.index = routeIndex;
  }

  @override
  void dispose() {
    _controller.removeListener(_onChangeTab);
    super.dispose();
  }

  void _onChangeTab() {
    setState(() {
      _currentIndex = _controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: _pages[_currentIndex]['title'].toUpperCase(),
        currentRoute: _pages[_currentIndex]['routeName'],
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(
            198,
            198,
            198,
            0.15,
          ),
        ),
        onTap: (int index) {
          _controller.animateTo(index);
        },
        items: <BottomNavigationBarItem>[
          for (var i = 0; i < _pages.length; i++)
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _currentIndex == i
                          ? Colors.black
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: SvgPicture.asset(
                  _pages[i]['icon'],
                  color: _currentIndex == i
                      ? Colors.black
                      : Color.fromRGBO(
                          0,
                          0,
                          0,
                          0.25,
                        ),
                ),
              ),
            ),
        ],
      ),
      body: TabBarView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          for (var p in _pages) p['page'] as Widget,
        ],
      ),
    );
  }
}
