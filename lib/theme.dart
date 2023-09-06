import 'package:flutter/material.dart';

const cardRadius = Radius.circular(12);
const chipRadius = Radius.circular(5);
const accordionRadius = Radius.circular(15);
const starsRankColor = Color.fromRGBO(255, 168, 0, 1);

const colorScheme = ColorScheme.light(
  primary: Colors.white,
  onPrimary: Colors.black,
  secondary: Color.fromRGBO(251, 251, 252, 1),
  onSecondary: Color.fromRGBO(130, 135, 150, 1),
  tertiary: Color.fromRGBO(13, 114, 255, 0.1),
  onTertiary: Color.fromRGBO(13, 114, 255, 1),
  background: Color.fromRGBO(246, 246, 249, 1),
  outline: Color.fromRGBO(232, 233, 236, 1),
  onSecondaryContainer: Color.fromRGBO(130, 135, 150, 0.15),
);

const textTheme = TextTheme(
  bodySmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.2,
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.2,
  ),
  bodyLarge: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.2,
  ),
  titleLarge: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 1.2,
  ),
  displaySmall: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    height: 1.2,
  ),
);

ThemeData obtainTheme(ColorScheme colorScheme) {
  return ThemeData(
    colorScheme: colorScheme,
    fontFamily: 'SF Pro Display',
    textTheme: textTheme.copyWith(
      bodySmall: textTheme.bodySmall!.apply(
        color: colorScheme.onSecondary,
      ),
      displaySmall: textTheme.displaySmall!.apply(
        color: colorScheme.onPrimary,
      ),
    ),
    scaffoldBackgroundColor: colorScheme.onTertiary,
    primaryColor: colorScheme.primary,
    cardTheme: const CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(cardRadius)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primary,
      elevation: 1,
      centerTitle: true,
    ),
    dividerTheme: DividerThemeData(
      color: colorScheme.onSecondaryContainer,
      thickness: 1,
      space: 1,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: colorScheme.secondary,
      elevation: 0,
      labelPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(chipRadius),
      ),
      labelStyle: textTheme.bodyMedium!.copyWith(
        height: 1.2,
        color: colorScheme.onSecondary,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.onTertiary,
        foregroundColor: colorScheme.primary,
        fixedSize: const Size.fromWidth(double.maxFinite),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: textTheme.bodyMedium!.copyWith(
          height: 1.1,
          letterSpacing: 0.1,
        ),
      ),
    ),
  );
}

const textInputStyle = TextStyle(
  backgroundColor: Color.fromRGBO(246, 246, 249, 1),
);

ButtonStyle getAuxButtonStyle(ColorScheme colorScheme) {
  return TextButton.styleFrom(
    backgroundColor: colorScheme.tertiary,
    foregroundColor: colorScheme.onTertiary,
    fixedSize: null,
    padding: const EdgeInsets.fromLTRB(10, 5, 8, 5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  );
}
