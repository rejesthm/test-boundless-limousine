import 'package:flutter/material.dart';

import 'button_styles.dart';

class ElevatedButtonThemes {
  const ElevatedButtonThemes._();

  static ElevatedButtonThemeData defaultStyle = ElevatedButtonThemeData(
    style: ButtonStyles.defaultStyle,
  );

  static ElevatedButtonThemeData darkStyle = ElevatedButtonThemeData(
    style: ButtonStyles.white,
  );
}
