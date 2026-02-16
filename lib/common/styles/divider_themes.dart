import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';

class DividerThemes {
  const DividerThemes._();

  static const defaultStyle = DividerThemeData(
    color: CustomAppColors.gray4,
    thickness: 1.0,
    space: 24.0,
  );

  static const darkStyle = DividerThemeData(
    color: CustomAppColors.gray2,
    thickness: 1.0,
    space: 16.0,
  );
}
