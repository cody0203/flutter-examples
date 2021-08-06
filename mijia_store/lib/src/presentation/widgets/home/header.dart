import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Good Morning',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 9),
              Text(
                'Cody',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 9),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  const Icon(
                    Icons.place_rounded,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Hanoi, Vietnam',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 14,
                          height: 1.57,
                        ),
                  )
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(
                0xFFF4F4FC,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            width: 72,
            height: 72,
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/images/avatar.png',
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
