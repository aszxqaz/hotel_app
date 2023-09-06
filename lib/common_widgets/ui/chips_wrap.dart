import 'package:flutter/material.dart';

class ChipsWrap extends StatelessWidget {
  const ChipsWrap({
    super.key,
    required this.labels,
  });

  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 0,
      children: labels
          .map(
            (label) => Chip(
              label: Text(label),
            ),
          )
          .toList(),
    );
  }
}
