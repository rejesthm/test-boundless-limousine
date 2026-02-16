import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';

class IconThemes {
  const IconThemes._();

  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 20.0;
  static const double iconSizeLarge = 24.0;
  static const double iconSizeXLarge = 32.0;
  static const double iconSizeXXLarge = 48.0;

  static const defaultStyle = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeLarge,
  );

  static const darkStyle = IconThemeData(
    color: CustomAppColors.gray5,
    size: iconSizeLarge,
  );

  static const primary = IconThemeData(
    color: CustomAppColors.primary,
    size: iconSizeLarge,
  );

  static const secondary = IconThemeData(
    color: CustomAppColors.secondary,
    size: iconSizeLarge,
  );

  static const light = IconThemeData(
    color: CustomAppColors.white,
    size: iconSizeLarge,
  );

  static const muted = IconThemeData(
    color: CustomAppColors.gray3,
    size: iconSizeLarge,
    opacity: 0.5,
  );

  static const error = IconThemeData(
    color: CustomAppColors.error,
    size: iconSizeLarge,
  );

  static const success = IconThemeData(
    color: CustomAppColors.success,
    size: iconSizeLarge,
  );

  static const warning = IconThemeData(
    color: CustomAppColors.warning,
    size: iconSizeLarge,
  );

  static const small = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeSmall,
  );

  static const medium = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeMedium,
  );

  static const large = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeLarge,
  );

  static const xLarge = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeXLarge,
  );

  static const xxLarge = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeXXLarge,
  );

  static const input = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeMedium,
  );

  static const appBar = IconThemeData(
    color: CustomAppColors.gray1,
    size: iconSizeLarge,
  );

  static const appBarDark = IconThemeData(
    color: CustomAppColors.white,
    size: iconSizeLarge,
  );

  static const button = IconThemeData(
    color: CustomAppColors.white,
    size: iconSizeMedium,
  );

  static const listItem = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeLarge,
  );

  static const navigation = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeLarge,
  );

  static const navigationActive = IconThemeData(
    color: CustomAppColors.primary,
    size: iconSizeLarge,
  );

  static const fab = IconThemeData(
    color: CustomAppColors.white,
    size: iconSizeLarge,
  );

  static IconThemeData custom({Color? color, double? size, double? opacity}) {
    return IconThemeData(
      color: color ?? CustomAppColors.gray2,
      size: size ?? iconSizeLarge,
      opacity: opacity,
    );
  }
}
