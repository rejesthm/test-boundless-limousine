import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/text_themes.dart';

extension BuildContextTextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}

extension TextStyleExtension on BuildContext {
  TextStyle get linkStyle => TextThemes.link;
  TextStyle get linkBoldStyle => TextThemes.linkBold;

  TextStyle get placeholderStyle => TextThemes.placeholder;
  TextStyle get inputLabelStyle => TextThemes.inputLabel;

  TextStyle get buttonPrimaryStyle => TextThemes.buttonPrimary;
  TextStyle get buttonSecondaryStyle => TextThemes.buttonSecondary;

  TextStyle get footerStyle => TextThemes.footer;
  TextStyle get overlineStyle => TextThemes.overline;
}
