import 'package:flutter/material.dart';

class HelloWorld2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(
        top: 100,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'Hello '.toUpperCase(),
                style: Theme.of(context).textTheme.headline1,
                children: <TextSpan>[
                  TextSpan(
                    text: 'World'.toUpperCase(),
                    style: Theme.of(context).textTheme.headline1?.merge(
                          TextStyle(
                            color: Colors.red,
                          ),
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            RichText(
              text: TextSpan(
                text: 'Hello '.toUpperCase(),
                style: Theme.of(context).textTheme.headline1,
                children: <TextSpan>[
                  TextSpan(
                    text: 'World'.toUpperCase(),
                    style: Theme.of(context).textTheme.headline1?.merge(
                          TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            RichText(
              text: TextSpan(
                text: 'Hello '.toUpperCase(),
                style: Theme.of(context).textTheme.headline1?.merge(
                      TextStyle(
                        color: const Color.fromRGBO(89, 89, 93, 1),
                      ),
                    ),
                children: <InlineSpan>[
                  WidgetSpan(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff59595D),
                      ),
                      child: Text(
                        'World'.toUpperCase(),
                        style: Theme.of(context).textTheme.headline1?.merge(
                              TextStyle(
                                color: Colors.white,
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
