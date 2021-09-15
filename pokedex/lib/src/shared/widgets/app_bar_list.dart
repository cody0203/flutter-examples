import 'package:flutter/material.dart';

class AppBarList extends StatelessWidget with PreferredSizeWidget {
  const AppBarList({Key? key}) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight,
      elevation: 0,
      flexibleSpace: Stack(
        children: <Widget>[
          Container(
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
            child: Container(
              height: kToolbarHeight + 40,
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA).withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Pokemon',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          // Container(
          //   width: double.infinity,
          //   margin: const EdgeInsets.only(bottom: 15),
          //   height: 36,
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: 'Search',
          //       contentPadding: const EdgeInsets.all(0),
          //       enabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(18),
          //         borderSide: const BorderSide(
          //           width: 0,
          //           color: Colors.transparent,
          //         ),
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(18),
          //         borderSide: const BorderSide(
          //           width: 0,
          //           color: Colors.transparent,
          //         ),
          //       ),
          //       fillColor: Colors.black.withOpacity(0.12),
          //       filled: true,
          //       prefixIcon: IconButton(
          //         padding: const EdgeInsets.all(0),
          //         icon: const Icon(Icons.search),
          //         color: const Color.fromRGBO(93, 25, 72, 1),
          //         onPressed: () {},
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
