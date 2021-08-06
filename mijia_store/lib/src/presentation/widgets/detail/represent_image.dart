import 'package:flutter/material.dart';

class RepresentImage extends StatefulWidget {
  const RepresentImage({
    Key? key,
    required this.imageAsset,
    required this.prevIndex,
    required this.currentIndex,
  }) : super(key: key);
  final String imageAsset;
  final int prevIndex;
  final int currentIndex;

  @override
  _RepresentImageState createState() => _RepresentImageState();
}

class _RepresentImageState extends State<RepresentImage>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _tween;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _tween = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(_slideController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _slideController.dispose();
  }

  @override
  void didUpdateWidget(covariant RepresentImage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.prevIndex == widget.currentIndex) {
      return;
    }
    _slideController.reset();
    if (widget.prevIndex < widget.currentIndex) {
      _tween = Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(_slideController);
    } else if (widget.prevIndex > widget.currentIndex) {
      _tween = Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(_slideController);
    }
    _slideController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 46,
      height: MediaQuery.of(context).size.height < 780
          ? MediaQuery.of(context).size.width * 0.6
          : MediaQuery.of(context).size.width * 0.7,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SlideTransition(
              position: _tween,
              child: Image.asset(
                widget.imageAsset,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
