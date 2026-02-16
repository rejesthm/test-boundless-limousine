import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:test_repo_example/common/styles/text_themes.dart';

class ButtonStyles {
  const ButtonStyles._();

  static ButtonStyle defaultStyle = ButtonStyle(
    padding: WidgetStateProperty.resolveWith<EdgeInsets>((states) {
      return const EdgeInsets.symmetric(horizontal: 27, vertical: 16);
    }),
    textStyle: WidgetStateProperty.all(TextThemes.defaultStyle.labelLarge),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      return CustomAppColors.white;
    }),
    minimumSize: WidgetStateProperty.all(const Size(96, 56)),
    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppColors.defaultStyle().disabled!;
      }
      return CustomAppColors.primary;
    }),
    overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
      return CustomAppColors.primaryVariant;
    }),
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
    }),
    elevation: WidgetStateProperty.resolveWith<double>((states) {
      if (states.contains(WidgetState.pressed)) {
        return 4;
      }
      return 2;
    }),
  );

  static ButtonStyle white = defaultStyle.copyWith(
    foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      return CustomAppColors.gray1;
    }),
    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) {
        return CustomAppColors.gray4;
      }
      return CustomAppColors.gray6;
    }),
    overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
      return CustomAppColors.gray5;
    }),
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(28));
    }),
  );

  static ButtonStyle whiteBordered = white.copyWith(
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
      if (states.contains(WidgetState.pressed)) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
      }

      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: CustomAppColors.primary, width: 1.2),
      );
    }),
  );

  static ButtonStyle greenBordered = white.copyWith(
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
      if (states.contains(WidgetState.pressed)) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
      }

      if (states.contains(WidgetState.disabled)) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.transparent, width: 1.2),
        );
      }

      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: CustomAppColors.success, width: 1.2),
      );
    }),
  );
  static ButtonStyle yellowBordered = white.copyWith(
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
      if (states.contains(WidgetState.pressed)) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
      }

      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: CustomAppColors.warning, width: 1.2),
      );
    }),
  );

  static ButtonStyle transparentWhiteBordered = ButtonStyle(
    foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
      return CustomAppColors.primary.withAlpha(40);
    }),
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: CustomAppColors.white, width: 1),
      );
    }),
  );
}
