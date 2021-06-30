import 'package:flutter/material.dart';

class FacebookLoginFooter extends StatelessWidget {
  final Size size;

  FacebookLoginFooter(this.size);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size.width * 0.7,
                child: Divider(
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                color: Colors.white,
                child: Text(
                  'Hoặc'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 42,
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0.0),
              backgroundColor: MaterialStateProperty.all(
                Color(0xffe7f3ff),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Tạo tài khoản mới',
              style: TextStyle(
                color: Color(0xff1077f7),
              ),
            ),
          ),
        )
      ],
    );
  }
}
