import 'dart:math' as math;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mijia_store/src/presentation/cubit/add_to_cart/add_to_cart_cubit.dart';

class TossAddToCartItem extends StatefulWidget {
  const TossAddToCartItem({
    Key? key,
    required this.imageAsset,
    required this.isRunning,
    required this.dx,
    required this.dy,
  }) : super(key: key);
  final String imageAsset;
  final bool isRunning;
  final double dx;
  final double dy;

  @override
  _TossAddToCartItemState createState() => _TossAddToCartItemState();
}

class _TossAddToCartItemState extends State<TossAddToCartItem>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Path _path;
  late double cartDx = MediaQuery.of(context).size.width - (80 * 2);
  late double cartDy = MediaQuery.of(context).size.height - (80 + 15);

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();

    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void didUpdateWidget(covariant TossAddToCartItem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if (widget.isRunning) {
      _animationController.reset();
      _path = drawPath();
      _buildNotifyDialog();
      _animationController.forward().whenComplete(() {
        BlocProvider.of<AddToCartCubit>(
          context,
          listen: false,
        ).addedFromList(
          dx: 0,
          dy: 0,
          isAdding: false,
          imageAsset: widget.imageAsset,
        );
        Navigator.of(context).pop();
      });
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    _path = drawPath();
    cartDx = MediaQuery.of(context).size.width - (80 * 2);
    cartDy = MediaQuery.of(context).size.height - (80 + 15);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          child: CustomPaint(
            painter: PathPainter(_path),
          ),
        ),
        Positioned(
          top: calculate(_animation.value).dy,
          left: calculate(_animation.value).dx,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: widget.isRunning ? 1 : 0,
            child: Transform.scale(
              scale: widget.isRunning ? 1 : 0,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      offset: const Offset(0.0, 8.0),
                      blurRadius: 20,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Image.asset(
                  widget.imageAsset,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Path drawPath() {
    final Path path = Path()
      ..moveTo(widget.dx, widget.dy)
      ..lineTo(
        widget.dx,
        widget.dy,
      )
      ..quadraticBezierTo(
        widget.dx,
        widget.dx - 100,
        cartDx,
        cartDy,
      );
    return path;
  }

  Offset calculate(double value) {
    final PathMetrics pathMetrics = _path.computeMetrics();
    final PathMetric pathMetric = pathMetrics.elementAt(0);
    final double newValue = pathMetric.length * value;
    final Tangent pos = pathMetric.getTangentForOffset(newValue)!;
    return pos.position;
  }

  void _buildNotifyDialog() {
    Future.delayed(Duration.zero, () async {
      showDialog(
          barrierDismissible: false,
          useRootNavigator: false,
          barrierColor: Colors.transparent,
          context: context,
          builder: (_) {
            return Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              insetPadding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.25),
              child: Container(
                height: 120,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: const Offset(0.0, 8.0),
                      blurRadius: 10,
                      color: Theme.of(context).shadowColor,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.check_circle,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Added to  cart',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}

class PathPainter extends CustomPainter {
  PathPainter(this.path);
  Path path;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
