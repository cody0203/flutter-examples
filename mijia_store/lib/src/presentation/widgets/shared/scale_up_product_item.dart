import 'package:flutter/material.dart';

import '../../../domain/entities/product.dart';
import 'vertical_product_item.dart';

class ScaleAnimatedVerticalProductItem extends StatefulWidget {
  const ScaleAnimatedVerticalProductItem({
    Key? key,
    required this.product,
    required this.isAtFirstEdge,
  }) : super(key: key);
  final Product product;
  final bool isAtFirstEdge;

  @override
  _ScaleAnimatedVerticalProductItemState createState() =>
      _ScaleAnimatedVerticalProductItemState();
}

class _ScaleAnimatedVerticalProductItemState
    extends State<ScaleAnimatedVerticalProductItem>
    with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );

  late final Animation<double> _scaleUpAnimation;

  @override
  void initState() {
    // TODO: implement initState
    _scaleUpAnimation = Tween<double>(
      begin: 1,
      end: 1.2,
    ).animate(_animationController);
    super.initState();

    if (widget.isAtFirstEdge) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void didUpdateWidget(covariant ScaleAnimatedVerticalProductItem oldWidget) {
    // TODO: implement didUpdateWidget
    if (oldWidget.isAtFirstEdge) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleUpAnimation,
      child: VerticalProductItem(
        product: widget.product,
      ),
    );
  }
}
