import 'package:flutter/material.dart';
import '../../features/pokemon/presentation/screens/list/pokemon_list_screen.dart';
import 'package:pokedex/src/shared/widgets/app_bar_list.dart';

class AppTabRoutes extends StatefulWidget {
  const AppTabRoutes({
    Key? key,
  }) : super(key: key);

  @override
  _AppTabRoutesState createState() => _AppTabRoutesState();
}

class _AppTabRoutesState extends State<AppTabRoutes> {
  int _selectedIndex = 0;
  late AnimationController animationController;
  final List<Widget> _pages = const <Widget>[
    PokemonListScreen(),
    Center(
      child: Text('Moves'),
    ),
    Center(
      child: Text('Item'),
    )
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onChangeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarList(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Stack(
        children: <Widget>[
          Container(
            height: 100,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromRGBO(110, 149, 253, 1),
                  Color.fromRGBO(111, 222, 250, 1),
                  Color.fromRGBO(141, 224, 97, 1),
                  Color.fromRGBO(81, 232, 94, 1),
                ],
              ),
            ),
          ),
          Positioned(
            top: 7,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA).withOpacity(0.7),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black.withOpacity(0.2),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 30,
                      height: 30,
                      child: Opacity(
                        opacity: _selectedIndex == 0 ? 1 : 0.2,
                        child: Image.asset('assets/images/pokeball_icon.png'),
                      ),
                    ),
                    label: 'Pokeball',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 30,
                      height: 30,
                      child: Opacity(
                        opacity: _selectedIndex == 1 ? 1 : 0.2,
                        child: Image.asset('assets/images/move_icon.png'),
                      ),
                    ),
                    label: 'Moves',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 30,
                      height: 30,
                      child: Opacity(
                        opacity: _selectedIndex == 2 ? 1 : 0.2,
                        child: Image.asset('assets/images/item_icon.png'),
                      ),
                    ),
                    label: 'Items',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onChangeTab,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
