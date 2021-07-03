import 'package:flutter/material.dart';

import 'package:intl/intl.dart' show NumberFormat;

import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import './article_content.dart';

import './avatar.dart';

class ArticleItem extends StatefulWidget {
  final String avatar;
  final String name;
  final String image;
  final bool isSeen;
  final int likeCount;
  final String content;
  final String dateAgo;

  ArticleItem({
    required this.avatar,
    required this.name,
    required this.image,
    required this.isSeen,
    required this.likeCount,
    required this.content,
    required this.dateAgo,
  });

  @override
  _ArticleItemState createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  bool isReadMoreAvailable = true;
  Widget _renderIconButton({
    required IconData icon,
    Alignment alignment = Alignment.centerLeft,
  }) {
    return IconButton(
      alignment: alignment,
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  Widget _renderArticleContentPadding({
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: child,
    );
  }

  void _showMoreContent() {
    setState(() {
      isReadMoreAvailable = !isReadMoreAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  child: Avatar(
                    avatar: widget.avatar,
                    isSeen: widget.isSeen,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                _renderIconButton(
                  icon: FeatherIcons.moreHorizontal,
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
          ),
          Container(
            child: Image(
              image: AssetImage(widget.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    _renderIconButton(
                      icon: FeatherIcons.heart,
                    ),
                    _renderIconButton(
                      icon: FeatherIcons.messageCircle,
                    ),
                    _renderIconButton(
                      icon: FeatherIcons.send,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: _renderIconButton(
                          icon: FeatherIcons.bookmark,
                          alignment: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ],
                ),
                _renderArticleContentPadding(
                  child: Text(
                    '${NumberFormat.decimalPattern().format(widget.likeCount).toString()} likes',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _renderArticleContentPadding(
                  child: ArticleContent(
                    name: widget.name,
                    content: widget.content,
                    isReadMoreAvailable: isReadMoreAvailable,
                    showMoreContent: _showMoreContent,
                  ),
                ),
                _renderArticleContentPadding(
                  child: Text(
                    widget.dateAgo,
                    style: Theme.of(context).textTheme.bodyText1?.merge(
                          TextStyle(
                            fontSize: 12,
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
