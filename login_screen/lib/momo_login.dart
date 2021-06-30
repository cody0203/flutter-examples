import 'package:flutter/material.dart';
import 'package:login_screen/widgets/momo_login/momo_common_text.dart';

class MomoLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      margin: EdgeInsets.only(
        top: 60,
      ),
      child: Column(
        children: [
          Text(
            'Xin chào!',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 20),
          MomoCommonText('Phạm Công Định'),
          SizedBox(height: 8),
          MomoCommonText('0123456789'),
          SizedBox(height: 30),
          TextField(
            maxLength: 6,
            buildCounter: (
              BuildContext ctx, {
              required int currentLength,
              required int? maxLength,
              required bool isFocused,
            }) =>
                null,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            obscureText: true,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff929292),
            ),
            decoration: InputDecoration(
              hintText: 'Nhập mật khẩu',
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
              ),
              contentPadding: const EdgeInsets.all(20),
              prefixIcon: Icon(
                Icons.lock,
                size: 16,
                color: Color(
                  0xff929292,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color(0xff8d015a),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              onPressed: () {},
              child: MomoCommonText('Đăng nhập'),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MomoCommonText('Quên mật khẩu'),
              MomoCommonText('Thoát tài khoản'),
            ],
          ),
        ],
      ),
    );
  }
}
