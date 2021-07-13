import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/core/bloc/bloc_with_state.dart';
import '../../domain/entities/article.dart';
import '../blocs/articles_bloc.dart';
import '../widgets/article_item.dart';

class TopHeadlinesView extends StatefulWidget {
  @override
  _TopHeadlinesViewState createState() => _TopHeadlinesViewState();
}

class _TopHeadlinesViewState extends State<TopHeadlinesView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScrollListener() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final remoteArticleBloc = BlocProvider.of<ArticlesBloc>(context);
    final state = remoteArticleBloc.blocProcessState;

    if ((currentScroll >= maxScroll - (maxScroll / 0.7) &&
            currentScroll <= maxScroll) &&
        state == BlocProcessState.idle) {
      remoteArticleBloc.add(const GetArticles());
    }
  }

  Widget _buildArticle(List<Article> articles, bool noMoreData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: articles.length + 1,
        itemBuilder: (BuildContext _, int index) {
          if (index == articles.length) {
            if (noMoreData) {
              return const SizedBox();
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }
          return ArticleItem(
            title: articles[index].title,
            urlToImage: articles[index].urlToImage,
            publishedAt: articles[index].publishedAt,
            url: articles[index].url ?? '',
            key: UniqueKey(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Worldwide News',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (BuildContext _, state) {
          if (state is ArticlesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ArticlesError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('An error occurred, please try again'),
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.refresh,
                    ),
                  )
                ],
              ),
            );
          }

          if (state is ArticlesDone) {
            return _buildArticle(state.articles!, state.noMoreData!);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
