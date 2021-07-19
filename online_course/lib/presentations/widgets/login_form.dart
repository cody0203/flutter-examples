import 'package:flutter/material.dart';

import '../views/home_screen.dart';
import 'main_button.dart';
import 'text_input.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _radioValue = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTextInput(label: 'Email'),
        SizedBox(height: 13),
        MainTextInput(label: 'Password'),
        SizedBox(height: 21),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Radio(
                  value: _radioValue,
                  groupValue: 'remember',
                  onChanged: (String? value) {
                    setState(() {
                      _radioValue = 'remember';
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  splashRadius: 0,
                  activeColor: Theme.of(context).primaryColor,
                ),
                Text(
                  'Remember me',
                  style: Theme.of(context).textTheme.bodyText2!.merge(
                        TextStyle(
                          color: Color(
                            0xffCCCCCC,
                          ),
                        ),
                      ),
                ),
              ],
            ),
            Text(
              'Forgot Pass?',
              style: Theme.of(context).textTheme.bodyText2!.merge(
                    TextStyle(
                      color: Color(
                        0xffCCCCCC,
                      ),
                    ),
                  ),
            ),
          ],
        ),
        SizedBox(height: 23),
        SizedBox(
          width: double.infinity,
          child: MainButton(
            child: Text(
              'Login',
              style: Theme.of(context).textTheme.headline2!.merge(
                    TextStyle(
                      color: Colors.white,
                    ),
                  ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                HomeScreen.routeName,
              );
            },
          ),
        ),
      ],
    );
  }
}
