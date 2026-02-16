import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:test_repo_example/common/styles/icon_themes.dart';

class AppBarThemes {
  const AppBarThemes._();

  static const defaultStyle = AppBarTheme(
    elevation: 0,
    iconTheme: IconThemes.defaultStyle,
    backgroundColor: Colors.transparent,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: CustomAppColors.primaryText,
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
  );

  static const darkStyle = AppBarTheme(
    backgroundColor: CustomAppColors.darkScaffold,
    elevation: 0,
    iconTheme: IconThemes.darkStyle,
    titleTextStyle: TextStyle(
      color: CustomAppColors.gray6,
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
  );
}
