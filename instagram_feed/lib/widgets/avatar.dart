import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatar;
  final bool isSeen;

  Avatar({
    required this.avatar,
    required this.isSeen,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        gradient: isSeen
            ? null
            : LinearGradient(
                colors: [
                  Color(0xfff89e4c),
                  Color(0xfff89e4c),
                  Color(0xffc72e8f),
                  Color(0xffc72e8f),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(35),
        ),
        padding: const EdgeInsets.all(2),
        child: CircleAvatar(
          child: ClipOval(
            child: Image.asset(
              avatar,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
