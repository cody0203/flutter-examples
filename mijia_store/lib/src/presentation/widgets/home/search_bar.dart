import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                fillColor: const Color(0xFFF4F4FC),
                filled: true,
                hintText: 'Search',
                contentPadding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 27,
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).hintColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(left: 9),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 10,
                    color: Theme.of(context).shadowColor,
                    offset: const Offset(0, 8.0),
                  ),
                ]),
            child: const RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.tune_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
