import 'package:flutter/material.dart';
import 'package:login_screen/widgets/facebook_login/facebook_login_footer.dart';

import '../widgets/facebook_login/facebook_textfield.dart';
import '../models/facebook_input_types.dart';

class FacebookLogin extends StatefulWidget {
  @override
  _FacebookLoginState createState() => _FacebookLoginState();
}

class _FacebookLoginState extends State<FacebookLogin> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();

  bool isEmailFocus = false;
  double _bigBannerSize = 300;
  double _smallBannerSize = 120;

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(_onEmailFocusChange);

    emailController.addListener(_setEmailValue);
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();

    super.dispose();
  }

  void _onEmailFocusChange() {
    setState(() {
      isEmailFocus = emailFocusNode.hasFocus;
    });
  }

  void _setEmailValue() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final heigth = size.height - padding.top - padding.bottom;
    final softkeyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      height: heigth,
      child: Column(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(
              milliseconds: 170,
            ),
            height:
                softkeyboardHeight > 0.0 ? _smallBannerSize : _bigBannerSize,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/facebook-banner.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 22,
              left: 22,
              right: 22,
            ),
            child: Container(
              height: heigth -
                  (softkeyboardHeight > 0.0
                      ? softkeyboardHeight + _smallBannerSize - 22
                      : _bigBannerSize) -
                  22,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: Color(0xffcdcdcf),
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            FacebookTextField(
                              label: 'Số điện thoại hoặc email',
                              type: InputType.email,
                              controller: emailController,
                              focusNode: emailFocusNode,
                              isEmailFocus: isEmailFocus,
                            ),
                            FacebookTextField(
                              label: 'Mật khẩu',
                              type: InputType.password,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 42,
                        margin: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xff1977f3),
                            ),
                            elevation: MaterialStateProperty.all(0.0),
                          ),
                          onPressed: () {},
                          child: Text('Đăng nhập'),
                        ),
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {},
                        child: const Text('Quên mật khẩu?'),
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {},
                        child: const Text('Quay lại'),
                      ),
                    ],
                  ),
                  FacebookLoginFooter(size),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
