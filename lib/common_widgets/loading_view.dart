import 'package:flutter/material.dart';
import 'package:hotel_app/common_widgets/ui/spinner.dart';
import 'package:hotel_app/common_widgets/ui/typography.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
    required this.text,
    this.backgroundColor,
  });

  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spinner(),
            TitleLarge(
              text,
              color: theme.colorScheme.primary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
