import 'package:flutter/material.dart';

import '../widgets/connect_result.dart';

class ConnectSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: Color(0xffE3F7FA),
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 67),
          child: Column(
            children: <Widget>[
              Text(
                'We Connect',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 32),
              Container(
                height: 514,
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Image.asset(
                      'assets/images/europe_map.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 83),
              Padding(
                padding: const EdgeInsets.only(left: 69, right: 78),
                child: Text(
                  'We bring Vietnamese \n entrepreneurs who are currently residing in Europe together, and connect them with a vast network \n of stakeholders in our startup ecosystem.',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 120),
              Container(
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      ConnectResult(
                        count: '4K+',
                        description: 'Followers & \nSubscribers',
                      ),
                      SizedBox(width: 64),
                      ConnectResult(
                        count: '20+',
                        description: 'Founders & \n Startups',
                      ),
                      SizedBox(width: 64),
                      ConnectResult(
                        count: '4K+',
                        description: 'Followers & \nSubscribers',
                      ),
                      SizedBox(width: 64),
                      ConnectResult(
                        count: '20+',
                        description: 'Founders & \n Startups',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -50,
          right: -50,
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              border: Border.all(
                width: 6,
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(70),
            ),
          ),
        ),
      ],
    );
  }
}
