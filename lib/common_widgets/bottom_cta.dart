import 'package:flutter/material.dart';
import 'package:hotel_app/common_widgets/ui/buttons.dart';

class BottomCta extends StatelessWidget {
  const BottomCta({
    super.key,
    required this.ctaClickHandler,
    required this.text,
  });
  final void Function() ctaClickHandler;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 6),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: Border(
          top: BorderSide(
            width: 1,
            color: theme.colorScheme.outline,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        child: CtaButton(
          text: text,
          onPressed: ctaClickHandler,
        ),
      ),
    );
  }
}
