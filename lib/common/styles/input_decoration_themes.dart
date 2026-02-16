import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:test_repo_example/common/styles/text_themes.dart';

class InputDecorationThemes {
  const InputDecorationThemes._();

  static const double _borderRadius = 6.0;
  static const double _borderWidth = 1.0;
  static const double _focusedBorderWidth = 1.5;

  static final defaultStyle = InputDecorationTheme(
    fillColor: CustomAppColors.white,
    filled: true,

    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),

    iconColor: CustomAppColors.gray2,
    prefixIconColor: CustomAppColors.gray2,
    suffixIconColor: CustomAppColors.gray2,

    labelStyle: const TextStyle(
      fontFamily: 'Figtree',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: CustomAppColors.gray3,
    ),
    floatingLabelStyle: const TextStyle(
      fontFamily: 'Figtree',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: CustomAppColors.gray3,
    ),

    hintStyle: TextThemes.placeholder,

    helperStyle: const TextStyle(
      fontFamily: 'Figtree',
      fontSize: 12,
      color: CustomAppColors.gray3,
    ),
    errorStyle: const TextStyle(
      fontFamily: 'Figtree',
      fontSize: 12,
      color: CustomAppColors.error,
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(color: CustomAppColors.inputBorder),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(color: CustomAppColors.inputBorder),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.primary,
        width: _focusedBorderWidth,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.error,
        width: _borderWidth,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.error,
        width: _focusedBorderWidth,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: BorderSide.none,
    ),

    constraints: const BoxConstraints(minHeight: 48),
  );

  static InputDecoration formField({
    required String? labelText,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: CustomAppColors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      labelStyle: const TextStyle(
        fontFamily: 'Figtree',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: CustomAppColors.gray3,
      ),
      hintStyle: TextThemes.placeholder,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: CustomAppColors.inputBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: CustomAppColors.inputBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: CustomAppColors.primary,
          width: _focusedBorderWidth,
        ),
      ),
      constraints: const BoxConstraints(minHeight: 48),
    );
  }

  static final darkStyle = InputDecorationTheme(
    fillColor: CustomAppColors.darkCards,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    iconColor: CustomAppColors.gray4,
    prefixIconColor: CustomAppColors.gray4,
    suffixIconColor: CustomAppColors.gray4,
    labelStyle: TextThemes.inputLabel.copyWith(color: CustomAppColors.gray4),
    floatingLabelStyle: TextThemes.inputLabel.copyWith(
      color: CustomAppColors.gray4,
    ),
    hintStyle: TextThemes.placeholder.copyWith(color: CustomAppColors.gray4),
    helperStyle: const TextStyle(
      fontFamily: 'Figtree',
      fontSize: 12,
      color: CustomAppColors.gray4,
    ),
    errorStyle: const TextStyle(
      fontFamily: 'Figtree',
      fontSize: 12,
      color: CustomAppColors.errorDark,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.gray3,
        width: _borderWidth,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.gray3,
        width: _borderWidth,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.primary,
        width: _focusedBorderWidth,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.errorDark,
        width: _borderWidth,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.errorDark,
        width: _focusedBorderWidth,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.gray4,
        width: _borderWidth,
      ),
    ),
    constraints: const BoxConstraints(minHeight: 56),
  );

  static InputDecoration searchDecoration({
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText ?? 'Search...',
      prefixIcon: prefixIcon ?? const Icon(Icons.search),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: CustomAppColors.gray6,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: const BorderSide(
          color: CustomAppColors.primary,
          width: _focusedBorderWidth,
        ),
      ),
    );
  }

  static InputDecoration emailDecoration({
    String? labelText,
    String? hintText,
    bool showIcon = true,
  }) {
    return InputDecoration(
      labelText: labelText ?? 'EMAIL',
      hintText: hintText ?? 'email@companyname.com',
      prefixIcon: showIcon ? const Icon(Icons.email_outlined) : null,
    );
  }

  static InputDecoration passwordDecoration({
    String? labelText,
    String? hintText,
    bool obscureText = true,
    VoidCallback? onToggleVisibility,
    bool showIcon = true,
  }) {
    return InputDecoration(
      labelText: labelText ?? 'PASSWORD',
      hintText: hintText ?? '••••••••',
      prefixIcon: showIcon ? const Icon(Icons.lock_outlined) : null,
      suffixIcon:
          onToggleVisibility != null
              ? IconButton(
                icon: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: onToggleVisibility,
              )
              : null,
    );
  }
}
