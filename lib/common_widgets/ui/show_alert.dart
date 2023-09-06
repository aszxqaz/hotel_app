import 'package:flutter/material.dart';
import 'package:hotel_app/common_widgets/common_widgets.dart';

void showAlert(
  BuildContext context, {
  required String text,
  String? buttonText,
}) {
  final theme = Theme.of(context);
  showDialog(
    context: context,
    builder: (context) => Column(
      children: [
        const Spacer(),
        SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.only(top: 48, bottom: 32),
            child: PaddedCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: theme.textTheme.bodyLarge,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      buttonText ?? 'OK',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const Spacer()
      ],
    ),
  );
}
