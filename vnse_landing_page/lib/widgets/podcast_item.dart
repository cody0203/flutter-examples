import 'package:flutter/material.dart';

class PodcastItem extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String description;

  const PodcastItem({
    required this.thumbnail,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 1.25,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              thumbnail,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 24,
                left: 19,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyText2!.merge(
                          TextStyle(
                            color: Colors.black,
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
