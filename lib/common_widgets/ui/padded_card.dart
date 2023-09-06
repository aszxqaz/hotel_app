import 'package:flutter/material.dart';

class PaddedCard extends StatelessWidget {
  const PaddedCard({
    super.key,
    this.padding,
    this.margin,
    this.shape,
    required this.child,
  });
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final ShapeBorder? shape;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: shape,
      margin: margin ?? const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
