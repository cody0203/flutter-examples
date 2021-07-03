import 'package:flutter/material.dart';

import './article_item.dart';

import '../../models/article.dart';

class ArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: articleList.length,
      itemBuilder: (BuildContext ctx, int index) {
        return ArticleItem(
          avatar: articleList[index].avatar,
          name: articleList[index].name,
          image: articleList[index].image,
          isSeen: articleList[index].isSeen,
          likeCount: articleList[index].likeCount,
          content: articleList[index].content,
          dateAgo: articleList[index].dateAgo,
        );
      },
    );
  }
}
