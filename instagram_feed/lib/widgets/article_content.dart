import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ArticleContent extends StatelessWidget {
  final String name;
  final String content;
  final bool isReadMoreAvailable;
  final VoidCallback showMoreContent;

  ArticleContent({
    required this.name,
    required this.content,
    required this.isReadMoreAvailable,
    required this.showMoreContent,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints constraints) {
        final link = TextSpan(
          text: ' more',
          style: Theme.of(context).textTheme.bodyText1,
          recognizer: TapGestureRecognizer()..onTap = showMoreContent,
        );

        final TextPainter contentPainter = TextPainter(
          maxLines: 1,
          text: TextSpan(
            text: content,
          ),
          textAlign: TextAlign.left,
          textDirection: TextDirection.rtl,
          ellipsis: '...',
        )..layout(
            maxWidth: constraints.maxWidth,
            minWidth: constraints.minWidth,
          );

        final TextPainter linkPainter = TextPainter(
          text: link,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
        )..layout(
            maxWidth: constraints.maxWidth,
            minWidth: constraints.minWidth,
          );

        final contentSize = contentPainter.size;
        final linkSize = linkPainter.size;

        final position = contentPainter.getPositionForOffset(
          Offset(
            contentSize.width - (linkSize.width),
            contentSize.height,
          ),
        );

        final endIndex = contentPainter.getOffsetBefore(position.offset);

        final isExeedMaxLines = contentPainter.didExceedMaxLines;

        TextSpan _renderContent() {
          final fullContent = TextSpan(
            text: content,
          );
          if (isExeedMaxLines) {
            if (isReadMoreAvailable) {
              return TextSpan(
                text: '${content.substring(
                      0,
                      endIndex,
                    ).trimRight()}...',
                children: <TextSpan>[link],
              );
            } else {
              return fullContent;
            }
          }

          return fullContent;
        }

        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '${name} ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              _renderContent(),
            ],
          ),
        );
      },
    );
  }
}
