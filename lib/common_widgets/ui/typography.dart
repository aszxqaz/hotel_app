import 'package:flutter/material.dart';

class TitleLarge extends StatelessWidget {
  const TitleLarge(this.text, {super.key, this.textAlign, this.color});
  final String text;
  final TextAlign? textAlign;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: color,
          ),
      textAlign: textAlign,
    );
  }
}

class BodyMediumSecondary extends StatelessWidget {
  const BodyMediumSecondary(this.text, {super.key, this.textAlign});
  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      softWrap: true,
      style: theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSecondary,
      ),
      textAlign: textAlign,
    );
  }
}

class BodySmall extends StatelessWidget {
  const BodySmall(this.text, {super.key, this.textAlign});
  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      softWrap: true,
      style: theme.textTheme.bodySmall,
      textAlign: textAlign,
    );
  }
}

class BodyMedium extends StatelessWidget {
  const BodyMedium(this.text, {super.key, this.textAlign});
  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      softWrap: true,
      style: theme.textTheme.bodyMedium,
      textAlign: textAlign,
    );
  }
}

class DisplaySmall extends StatelessWidget {
  const DisplaySmall(this.text, {super.key, this.textAlign});
  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      softWrap: true,
      style: theme.textTheme.displaySmall,
      textAlign: textAlign,
    );
  }
}
