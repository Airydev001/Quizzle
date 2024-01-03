import 'package:flutter/material.dart';

enum SeparatorType {
  vertical,
  horizontal,
}

class EasySeparator extends StatelessWidget {
  final SeparatorType type;
  final double thickness;
  final Color color;
  final EdgeInsets margin;

  EasySeparator({
    this.type = SeparatorType.horizontal,
    this.thickness = 1.0,
    this.color = Colors.grey,
    this.margin = const EdgeInsets.symmetric(horizontal: 16.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: type == SeparatorType.vertical ? thickness : double.infinity,
      height: type == SeparatorType.horizontal ? thickness : double.infinity,
      margin: margin,
      child: type == SeparatorType.vertical
          ? FadeTransition(
              opacity: AlwaysStoppedAnimation<double>(1.0),
              child: Container(color: color),
            )
          : FadeTransition(
              opacity: AlwaysStoppedAnimation<double>(1.0),
              child: Container(color: color),
            ),
    );
  }
}

class EasySeparatedColumn extends StatelessWidget {
  final List<Widget> children;
  final SeparatorType separatorType;
  final double separatorThickness;
  final Color separatorColor;
  final EdgeInsets separatorMargin;
  final Duration animationDuration;

  EasySeparatedColumn({
    required this.children,
    this.separatorType = SeparatorType.horizontal,
    this.separatorThickness = 1.0,
    this.separatorColor = Colors.grey,
    this.separatorMargin = const EdgeInsets.symmetric(horizontal: 16.0),
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> separatedChildren = [];

    for (int i = 0; i < children.length; i++) {
      separatedChildren.add(children[i]);

      if (i < children.length - 1) {
        separatedChildren.add(
          FadeTransition(
            opacity: AlwaysStoppedAnimation<double>(0.0),
            child: EasySeparator(
              type: separatorType,
              thickness: separatorThickness,
              color: separatorColor,
              margin: separatorMargin,
            ),
          ),
        );
      }
    }

    return Column(
      children: separatedChildren,
    );
  }
}

class EasySeparatedRow extends StatelessWidget {
  final List<Widget> children;
  final SeparatorType separatorType;
  final double separatorThickness;
  final Color separatorColor;
  final EdgeInsets separatorMargin;
  final Duration animationDuration;

  EasySeparatedRow({
    required this.children,
    this.separatorType = SeparatorType.vertical,
    this.separatorThickness = 1.0,
    this.separatorColor = Colors.grey,
    this.separatorMargin = const EdgeInsets.symmetric(vertical: 8.0),
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> separatedChildren = [];

    for (int i = 0; i < children.length; i++) {
      separatedChildren.add(children[i]);

      if (i < children.length - 1) {
        separatedChildren.add(
          FadeTransition(
            opacity: AlwaysStoppedAnimation<double>(0.0),
            child: EasySeparator(
              type: separatorType,
              thickness: separatorThickness,
              color: separatorColor,
              margin: separatorMargin,
            ),
          ),
        );
      }
    }

    return Row(
      children: separatedChildren,
    );
  }
}