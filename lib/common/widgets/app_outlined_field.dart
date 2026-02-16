import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:test_repo_example/common/styles/app_spacing.dart';

class AppOutlinedField extends StatelessWidget {
  const AppOutlinedField({
    super.key,
    this.controller,
    this.hintText,
    this.text,
    this.labelText,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingIconColor,
    this.onTap,
    this.readOnly = false,
    this.errorText,
    this.height = 56,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? text;
  final String? labelText;
  final Widget? leadingIcon;
  final Widget? trailingIcon;

  final Color? leadingIconColor;
  final VoidCallback? onTap;
  final bool readOnly;
  final String? errorText;
  final double height;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: height,
          child: TextFormField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            keyboardType: keyboardType,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: CustomAppColors.formTextPrimary,
            ),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: theme.textTheme.bodyMedium?.copyWith(
                color: CustomAppColors.formTextHint,
              ),
              floatingLabelStyle: theme.textTheme.bodySmall?.copyWith(
                color: CustomAppColors.formTextHint,
                fontSize: 12,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintText: hintText,
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color: CustomAppColors.formTextHint,
              ),
              prefixIcon: leadingIcon != null
                  ? (leadingIconColor != null
                        ? IconTheme(
                            data: IconThemeData(color: leadingIconColor),
                            child: leadingIcon!,
                          )
                        : leadingIcon)
                  : null,
              suffixIcon: trailingIcon,
              filled: true,
              fillColor: CustomAppColors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.md,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: CustomAppColors.formBorder,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: hasError
                      ? CustomAppColors.error
                      : CustomAppColors.formBorder,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: hasError
                      ? CustomAppColors.error
                      : CustomAppColors.formBorder,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        if (errorText != null && errorText!.isNotEmpty) ...[
          const VerticalSpace(AppSpacing.sm),
          Text(
            errorText!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: CustomAppColors.error,
            ),
          ),
        ],
      ],
    );
  }
}
