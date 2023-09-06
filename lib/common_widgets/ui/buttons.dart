import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/assets.dart';
import 'package:hotel_app/theme.dart';

class CtaButton extends StatelessWidget {
  const CtaButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class AuxButton extends StatelessWidget {
  const AuxButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: getAuxButtonStyle(Theme.of(context).colorScheme),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          const SizedBox(width: 12),
          SvgPicture.asset(
            svgArrowRight,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onTertiary,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.svgSrc,
    required this.onPressed,
    this.inversed = false,
  });
  final String svgSrc;
  final bool inversed;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = inversed ? colorScheme.onTertiary : Colors.white;
    final bgColor = inversed ? colorScheme.tertiary : colorScheme.onTertiary;

    return FilledButton(
      onPressed: onPressed,
      style: Theme.of(context).filledButtonTheme.style!.copyWith(
            fixedSize: const MaterialStatePropertyAll(Size.fromRadius(16)),
            padding: const MaterialStatePropertyAll(EdgeInsets.zero),
            backgroundColor: MaterialStatePropertyAll(bgColor),
            minimumSize: const MaterialStatePropertyAll(Size.zero),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
      child: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
