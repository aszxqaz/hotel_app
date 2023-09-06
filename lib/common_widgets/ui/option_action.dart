import 'package:flutter/material.dart';
import 'package:hotel_app/common_widgets/ui/buttons.dart';
import 'package:hotel_app/common_widgets/ui/typography.dart';

class OptionAction extends StatelessWidget {
  const OptionAction({
    super.key,
    required this.handleActionClick,
    required this.svgSrc,
    required this.text,
  });
  final Function() handleActionClick;
  final String svgSrc;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleLarge(text),
        AppIconButton(
          svgSrc: svgSrc,
          onPressed: handleActionClick,
        ),
      ],
    );
  }
}
