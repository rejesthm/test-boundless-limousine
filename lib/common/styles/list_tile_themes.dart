import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';

class ListTileThemes {
  const ListTileThemes._();

  static const defaultStyle = ListTileThemeData(
    tileColor: CustomAppColors.white,
    contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
  );

  static final roundedStyle = ListTileThemeData(
    tileColor: CustomAppColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
  );
}
