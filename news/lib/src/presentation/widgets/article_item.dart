import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleItem extends StatelessWidget {
  final String? title;
  final String? urlToImage;
  final String? publishedAt;
  final String url;
  final Key key;

  const ArticleItem({
    this.title,
    this.urlToImage,
    this.publishedAt,
    required this.url,
    required this.key,
  }) : super(key: key);

  void _openLink(BuildContext context) async {
    final isCanLauch = await canLaunch(url);

    if (isCanLauch) {
      await launch(url);
    } else {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Cannot open this link'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openLink(context),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.amber,
              width: 2.0,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInImage.memoryNetwork(
              key: key,
              placeholder: kTransparentImage,
              fadeInDuration: Duration(milliseconds: 200),
              image: urlToImage ?? '',
              width: 150,
              height: 85,
              fit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/no-image-available.jpeg',
                  fit: BoxFit.contain,
                  width: 150,
                  height: 85,
                );
              },
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: Theme.of(context).textTheme.headline1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    timeago.format(
                      DateTime.parse(
                        publishedAt ?? DateTime.now().toIso8601String(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
