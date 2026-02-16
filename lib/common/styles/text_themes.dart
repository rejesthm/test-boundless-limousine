import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';

class TextThemes {
  const TextThemes._();

  static const String _fontFamily = 'Figtree';

  static final defaultStyle = TextTheme(
    displayLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 36,
      height: 1.2,
      letterSpacing: -0.5,
      color: CustomAppColors.gray1,
    ),

    displayMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 32,
      height: 1.25,
      letterSpacing: -0.25,
      color: CustomAppColors.gray1,
    ),

    displaySmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 28,
      height: 1.3,
      letterSpacing: 0,
      color: CustomAppColors.gray1,
    ),

    headlineLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 24,
      height: 1.3,
      letterSpacing: 0,
      color: CustomAppColors.gray1,
    ),

    headlineMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 20,
      height: 1.4,
      letterSpacing: 0,
      color: CustomAppColors.gray1,
    ),

    headlineSmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 1.4,
      letterSpacing: 0,
      color: CustomAppColors.gray1,
    ),

    titleLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.15,
      color: CustomAppColors.gray1,
    ),

    titleMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 15,
      height: 1.5,
      letterSpacing: 0.15,
      color: CustomAppColors.gray1,
    ),

    titleSmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: 1.5,
      letterSpacing: 0.1,
      color: CustomAppColors.gray1,
    ),

    bodyLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.25,
      color: CustomAppColors.gray1,
    ),

    bodyMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.6,
      letterSpacing: 0.25,
      color: CustomAppColors.gray2,
    ),

    bodySmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 13,
      height: 1.6,
      letterSpacing: 0.25,
      color: CustomAppColors.gray2,
    ),

    labelLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 1.4,
      letterSpacing: 0.1,
      color: CustomAppColors.white,
    ),

    labelMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: 1.4,
      letterSpacing: 0.5,
      color: CustomAppColors.gray1,
    ),

    labelSmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.5,
      letterSpacing: 0.5,
      color: CustomAppColors.gray3,
    ),
  );

  static TextTheme darkStyle = TextTheme(
    displayLarge: defaultStyle.displayLarge!.copyWith(
      color: CustomAppColors.white,
    ),
    displayMedium: defaultStyle.displayMedium!.copyWith(
      color: CustomAppColors.white,
    ),
    displaySmall: defaultStyle.displaySmall!.copyWith(
      color: CustomAppColors.white,
    ),
    headlineLarge: defaultStyle.headlineLarge!.copyWith(
      color: CustomAppColors.white,
    ),
    headlineMedium: defaultStyle.headlineMedium!.copyWith(
      color: CustomAppColors.white,
    ),
    headlineSmall: defaultStyle.headlineSmall!.copyWith(
      color: CustomAppColors.white,
    ),
    titleLarge: defaultStyle.titleLarge!.copyWith(color: CustomAppColors.white),
    titleMedium: defaultStyle.titleMedium!.copyWith(
      color: CustomAppColors.white,
    ),
    titleSmall: defaultStyle.titleSmall!.copyWith(color: CustomAppColors.white),
    bodyLarge: defaultStyle.bodyLarge!.copyWith(color: CustomAppColors.gray6),
    bodyMedium: defaultStyle.bodyMedium!.copyWith(color: CustomAppColors.gray5),
    bodySmall: defaultStyle.bodySmall!.copyWith(color: CustomAppColors.gray5),
    labelLarge: defaultStyle.labelLarge!.copyWith(color: CustomAppColors.white),
    labelMedium: defaultStyle.labelMedium!.copyWith(
      color: CustomAppColors.white,
    ),
    labelSmall: defaultStyle.labelSmall!.copyWith(color: CustomAppColors.gray4),
  );

  static const TextStyle link = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.5,
    letterSpacing: 0.1,
    color: CustomAppColors.primary,
    decoration: TextDecoration.none,
  );

  static const TextStyle linkBold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 1.5,
    letterSpacing: 0.1,
    color: CustomAppColors.primary,
    decoration: TextDecoration.none,
  );

  static const TextStyle placeholder = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.25,
    color: CustomAppColors.gray3,
  );

  static const TextStyle footer = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.5,
    letterSpacing: 0.25,
    color: CustomAppColors.gray3,
  );

  static const TextStyle buttonPrimary = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.25,
    letterSpacing: 0.1,
    color: CustomAppColors.white,
  );

  static const TextStyle buttonSecondary = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.25,
    letterSpacing: 0.1,
    color: CustomAppColors.gray1,
  );

  static const TextStyle inputLabel = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 1.5,
    letterSpacing: 1.0,
    color: CustomAppColors.gray1,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 11,
    height: 1.5,
    letterSpacing: 1.5,
    color: CustomAppColors.gray3,
  );
}
