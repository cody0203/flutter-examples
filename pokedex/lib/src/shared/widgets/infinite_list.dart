import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class InfiniteList extends StatefulWidget {
  const InfiniteList({
    Key? key,
    required this.itemCount,
    required this.currentPage,
    required this.totalPages,
    required this.blocAction,
    required this.itemBuilder,
    required this.threshold,
    required this.onRefreshAction,
  }) : super(key: key);
  final int itemCount;
  final int currentPage;
  final int totalPages;
  final double threshold;
  final VoidCallback blocAction;
  final Widget Function(BuildContext, int) itemBuilder;
  final VoidCallback onRefreshAction;

  @override
  _StateInfiniteList createState() => _StateInfiniteList();
}

class _StateInfiniteList extends State<InfiniteList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollListener);
    if (widget.threshold > 1 && widget.threshold < 0) {
      throw Exception('Threshold must be 0 to 1');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScrollListener() {
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.position.pixels;
    if (!_scrollController.hasClients ||
        (widget.currentPage == widget.totalPages)) return;

    if (currentScroll >= (maxScroll * widget.threshold) &&
        currentScroll <= maxScroll) {
      widget.blocAction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        widget.onRefreshAction();
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.itemCount,
        itemBuilder: widget.itemBuilder,
      ),
    );
  }
}
