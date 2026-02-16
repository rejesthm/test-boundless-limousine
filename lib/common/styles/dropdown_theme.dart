import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:test_repo_example/common/styles/icon_themes.dart';

class DropdownThemes {
  const DropdownThemes._();

  static final defaultStyle = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      filled: true,
      fillColor: CustomAppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: CustomAppColors.gray4),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: CustomAppColors.gray4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: CustomAppColors.primary, width: 2),
      ),
    ),
    textStyle: const TextStyle(
      fontSize: 16,
      color: CustomAppColors.primaryText,
    ),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(CustomAppColors.white),
      elevation: WidgetStateProperty.all(2),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      side: WidgetStateProperty.all(
        const BorderSide(color: CustomAppColors.gray4),
      ),
    ),
  );

  static const darkStyle = AppBarTheme(
    backgroundColor: CustomAppColors.darkScaffold,
    elevation: 0,
    iconTheme: IconThemes.darkStyle,
  );
}
