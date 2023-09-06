import 'package:flutter/material.dart';
import 'package:hotel_app/common_widgets/ui/typography.dart';

class DetailedDisplay extends StatelessWidget {
  const DetailedDisplay({
    super.key,
    required this.display,
    required this.details,
  });
  final String display;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        DisplaySmall(display),
        Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 7),
          child: BodyMediumSecondary(details),
        ),
      ],
    );
  }
}
