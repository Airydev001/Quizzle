import 'package:flutter/material.dart';

enum ShimmerDirection {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
}

class AdvancedShimmer extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final ShimmerDirection direction;
  final double gradientBegin;
  final double gradientEnd;
  final List<Color> gradientColors;

  AdvancedShimmer({
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.direction = ShimmerDirection.leftToRight,
    this.gradientBegin = 0.0,
    this.gradientEnd = 1.0,
    this.gradientColors = const [
      Colors.grey,
      Colors.white,
      Colors.grey,
    ],
  });

  @override
  _AdvancedShimmerState createState() => _AdvancedShimmerState();
}

class _AdvancedShimmerState extends State<AdvancedShimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: _getGradientBegin(),
              end: _getGradientEnd(),
              colors: widget.gradientColors,
              stops: [widget.gradientBegin, widget.gradientEnd, widget.gradientBegin],
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: widget.child,
    );
  }

  AlignmentGeometry _getGradientBegin() {
    switch (widget.direction) {
      case ShimmerDirection.leftToRight:
        return Alignment.centerLeft;
      case ShimmerDirection.rightToLeft:
        return Alignment.centerRight;
      case ShimmerDirection.topToBottom:
        return Alignment.topCenter;
      case ShimmerDirection.bottomToTop:
        return Alignment.bottomCenter;
    }
  }

  AlignmentGeometry _getGradientEnd() {
    switch (widget.direction) {
      case ShimmerDirection.leftToRight:
        return Alignment.centerRight;
      case ShimmerDirection.rightToLeft:
        return Alignment.centerLeft;
      case ShimmerDirection.topToBottom:
        return Alignment.bottomCenter;
      case ShimmerDirection.bottomToTop:
        return Alignment.topCenter;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
