import 'package:flutter/material.dart';
import 'package:mijia_store/src/presentation/widgets/shared/main_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: Text('Profile'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(65),
              ),
              child: const Icon(
                Icons.construction,
                color: Colors.white,
                size: 55,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Under Construction',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'Coming soon',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 15,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
