import 'package:flutter/material.dart';

extension BuildContextColorExtension on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}

class CustomAppColors {
  const CustomAppColors._();

  static const primary = Color(0xFFC4A05B);

  static const primaryVariant = Color(0xFFB8860B);

  static const secondary = Color(0xFF4A5B73);

  static const secondaryVariant = Color(0xFF7F8C9E);

  static const white = Color(0xFFFFFFFF);

  static const primaryBackground = Color(0xFFFFFFFF);

  static const inputBorder = Color(0xFFD0D0D0);

  static const toggleUnselected = Color(0xFFF5F5F5);

  static const toggleSelectedBackground = Color(0xFFF5F0E6);

  static const toggleUnselectedText = Color(0xFF5F5F5F);

  static const toggleOuterBorder = Color(0xFFE0E0E0);

  static const toggleSelectedBg = Color(0xFFFFF3D6);

  static const toggleSelectedGold = Color(0xFFD4A017);

  static const formBackground = Color(0xFFF8F9FB);

  static const formBorder = Color(0xFFE5E7EB);

  static const formTextPrimary = Color(0xFF111827);

  static const formTextSecondary = Color(0xFF6B7280);

  static const formTextHint = Color(0xFF9CA3AF);

  static const secondaryBackground = Color(0xFFE3F2FD);

  static const primaryText = Color(0xFF2D3142);

  static const secondaryText = Color(0xFF6B6E82);

  static const gray1 = Color(0xFF2D3142);

  static const gray2 = Color(0xFF6B6E82);

  static const gray3 = Color(0xFF9CA0B3);

  static const gray4 = Color(0xFFD1D4E0);

  static const gray5 = Color(0xFFE8EAF0);

  static const gray6 = Color(0xFFF5F6FA);

  static const error = Color(0xFFE85D75);

  static const alert = Color(0xFFD9455A);

  static const success = Color(0xFF4CAF50);

  static const warning = Color(0xFFFFB74D);

  static const darkScaffold = Color(0xFF1A1D2E);

  static const darkPrimary = Color(0xFF2D3142);

  static const darkCards = Color(0xFF3F4356);

  static const tertiary = Color(0xFF64B5F6);

  static const tertiaryLight = Color(0xFF90CAF9);

  static const tertiaryDark = Color(0xFF42A5F5);

  static const primaryContainerLight = Color(0xFFBBDEFB);

  static const tertiaryContainer = Color(0xFFE1F5FE);

  static const errorContainer = Color(0xFFFFEBEE);

  static const errorContainerDark = Color(0xFF8A3A3A);

  static const errorDark = Color(0xFFEF9A9A);

  static const onErrorContainer = Color(0xFF5A1F24);
}

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    this.text,
    this.secondaryText,
    this.accentText,
    this.textOnColour,
    this.link,
    this.secondaryTextOnColour,
    this.placeholder,
    this.disabledText,
    this.successText,
    this.attentionText,
    this.warningText,
    this.neutralText,
    this.tappable,
    this.accent,
    this.foreground,
    this.background,
    this.divider,
    this.disabled,
    this.success,
    this.attention,
    this.warning,
    this.neutral,
    this.information,
    this.scrim,
  });

  factory AppColors.defaultStyle() {
    return const AppColors(
      text: Color(0xFF2D3142),
      secondaryText: Color(0xFF6B6E82),
      accentText: Color(0xFFD1D4E0),
      textOnColour: Color(0xFFFFFFFF),
      link: Color(0xFF5B67CA),
      secondaryTextOnColour: Color(0xFFF5F4F8),
      placeholder: Color(0xFF9CA0B3),
      disabledText: Color(0xFFD1D4E0),
      successText: Color(0xFF388E3C),
      attentionText: Color(0xFFEF6C00),
      warningText: Color(0xFFE85D75),
      neutralText: Color(0xFF6B6E82),
      tappable: Color(0xFFC4A05B),
      accent: Color(0xFFC4A05B),
      foreground: Color(0xFFFFFFFF),
      background: Color(0xFFFFFFFF),
      divider: Color(0xFFD1D4E0),
      disabled: Color(0xFFE8EAF0),
      success: Color(0xFF4CAF50),
      attention: Color(0xFFFFB74D),
      warning: Color(0xFFE85D75),
      neutral: Color(0xFF9CA0B3),
      information: Color(0xFF5B67CA),
      scrim: Color(0x99000000),
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      text: Color(0xFFF5F6FA),
      secondaryText: Color(0xFFD1D4E0),
      accentText: Color(0xFFE8EAF0),
      textOnColour: Color(0xFF1A1D2E),
      link: Color(0xFF8B95E8),
      secondaryTextOnColour: Color(0xFF2D3142),
      placeholder: Color(0xFF9CA0B3),
      disabledText: Color(0xFF6B6E82),
      successText: Color(0xFF81C784),
      attentionText: Color(0xFFFFCC80),
      warningText: Color(0xFFEF9A9A),
      neutralText: Color(0xFFD1D4E0),
      tappable: Color(0xFF8B95E8),
      accent: Color(0xFF6B6E82),
      foreground: Color(0xFF3F4356),
      background: Color(0xFF1A1D2E),
      divider: Color(0xFF6B6E82),
      disabled: Color(0xFF3F4356),
      success: Color(0xFF81C784),
      attention: Color(0xFFFFCC80),
      warning: Color(0xFFEF9A9A),
      neutral: Color(0xFF9CA0B3),
      information: Color(0xFF8B95E8),
      scrim: Color(0xB3000000),
    );
  }

  final Color? text;
  final Color? secondaryText;
  final Color? accentText;
  final Color? textOnColour;
  final Color? link;
  final Color? secondaryTextOnColour;
  final Color? placeholder;
  final Color? disabledText;
  final Color? successText;
  final Color? attentionText;
  final Color? warningText;
  final Color? neutralText;
  final Color? tappable;
  final Color? accent;
  final Color? foreground;
  final Color? background;
  final Color? divider;
  final Color? disabled;
  final Color? success;
  final Color? attention;
  final Color? warning;
  final Color? neutral;
  final Color? information;
  final Color? scrim;

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      text: Color.lerp(text, other.text, t),
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t),
      accentText: Color.lerp(accentText, other.accentText, t),
      textOnColour: Color.lerp(textOnColour, other.textOnColour, t),
      link: Color.lerp(link, other.link, t),
      secondaryTextOnColour: Color.lerp(
        secondaryTextOnColour,
        other.secondaryTextOnColour,
        t,
      ),
      placeholder: Color.lerp(placeholder, other.placeholder, t),
      disabledText: Color.lerp(disabledText, other.disabledText, t),
      successText: Color.lerp(successText, other.successText, t),
      attentionText: Color.lerp(attentionText, other.attentionText, t),
      warningText: Color.lerp(warningText, other.warningText, t),
      neutralText: Color.lerp(neutralText, other.neutralText, t),
      tappable: Color.lerp(tappable, other.tappable, t),
      accent: Color.lerp(accent, other.accent, t),
      foreground: Color.lerp(foreground, other.foreground, t),
      background: Color.lerp(background, other.background, t),
      divider: Color.lerp(divider, other.divider, t),
      disabled: Color.lerp(disabled, other.disabled, t),
      success: Color.lerp(success, other.success, t),
      attention: Color.lerp(attention, other.attention, t),
      warning: Color.lerp(warning, other.warning, t),
      neutral: Color.lerp(neutral, other.neutral, t),
      information: Color.lerp(information, other.information, t),
      scrim: Color.lerp(scrim, other.scrim, t),
    );
  }

  @override
  AppColors copyWith({
    Color? text,
    Color? secondaryText,
    Color? accentText,
    Color? textOnColour,
    Color? link,
    Color? secondaryTextOnColour,
    Color? placeholder,
    Color? disabledText,
    Color? successText,
    Color? attentionText,
    Color? warningText,
    Color? neutralText,
    Color? tappable,
    Color? accent,
    Color? foreground,
    Color? background,
    Color? divider,
    Color? disabled,
    Color? success,
    Color? attention,
    Color? warning,
    Color? neutral,
    Color? information,
    Color? scrim,
  }) {
    return AppColors(
      text: text ?? this.text,
      secondaryText: secondaryText ?? this.secondaryText,
      accentText: accentText ?? this.accentText,
      textOnColour: textOnColour ?? this.textOnColour,
      link: link ?? this.link,
      secondaryTextOnColour:
          secondaryTextOnColour ?? this.secondaryTextOnColour,
      placeholder: placeholder ?? this.placeholder,
      disabledText: disabledText ?? this.disabledText,
      successText: successText ?? this.successText,
      attentionText: attentionText ?? this.attentionText,
      warningText: warningText ?? this.warningText,
      neutralText: neutralText ?? this.neutralText,
      tappable: tappable ?? this.tappable,
      accent: accent ?? this.accent,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      divider: divider ?? this.divider,
      disabled: disabled ?? this.disabled,
      success: success ?? this.success,
      attention: attention ?? this.attention,
      warning: warning ?? this.warning,
      neutral: neutral ?? this.neutral,
      information: information ?? this.information,
      scrim: scrim ?? this.scrim,
    );
  }
}
