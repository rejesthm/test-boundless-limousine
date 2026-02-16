import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';

class ColorSchemes {
  const ColorSchemes._();

  static ColorScheme defaultStyle = ColorScheme.fromSwatch().copyWith(
    primary: CustomAppColors.primary,
    secondary: CustomAppColors.secondary,
    tertiary: CustomAppColors.tertiary,
    error: CustomAppColors.error,
    onPrimary: CustomAppColors.white,
    onSecondary: CustomAppColors.primaryText,
    onTertiary: CustomAppColors.white,
    onError: CustomAppColors.white,
    onSurfaceVariant: CustomAppColors.gray2,
    primaryContainer: CustomAppColors.primaryContainerLight,
    secondaryContainer: CustomAppColors.primaryBackground,
    tertiaryContainer: CustomAppColors.tertiaryContainer,
    errorContainer: CustomAppColors.errorContainer,
    surface: CustomAppColors.primaryBackground,
    outline: CustomAppColors.secondary,
    onPrimaryContainer: CustomAppColors.gray1,
    onSecondaryContainer: CustomAppColors.gray1,
    onTertiaryContainer: CustomAppColors.gray1,
    onErrorContainer: CustomAppColors.onErrorContainer,
    onSurface: CustomAppColors.primaryText,
  );

  static ColorScheme darkStyle = ColorScheme.fromSwatch().copyWith(
    primary: CustomAppColors.secondary,
    secondary: CustomAppColors.secondaryVariant,
    tertiary: CustomAppColors.tertiaryLight,
    error: CustomAppColors.errorDark,
    onPrimary: CustomAppColors.darkScaffold,
    onSecondary: CustomAppColors.darkScaffold,
    onTertiary: CustomAppColors.darkScaffold,
    onError: CustomAppColors.darkScaffold,
    onSurfaceVariant: CustomAppColors.gray4,
    primaryContainer: CustomAppColors.primaryVariant,
    secondaryContainer: CustomAppColors.primary,
    tertiaryContainer: CustomAppColors.tertiaryDark,
    errorContainer: CustomAppColors.errorContainerDark,
    surface: CustomAppColors.darkCards,
    outline: CustomAppColors.gray3,
    onPrimaryContainer: CustomAppColors.gray6,
    onSecondaryContainer: CustomAppColors.gray6,
    onTertiaryContainer: CustomAppColors.gray6,
    onErrorContainer: CustomAppColors.gray6,
    onSurface: CustomAppColors.gray6,
  );
}
