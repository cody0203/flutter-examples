import 'package:flutter/material.dart';

class PodcastLinking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Listen now on',
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/spotify.png'),
            SizedBox(width: 26),
            Image.asset('assets/images/music.png'),
          ],
        ),
      ],
    );
  }
}
