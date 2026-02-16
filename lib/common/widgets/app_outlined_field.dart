import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    this.validator,
    this.inputFormatters,
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
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasError = errorText != null && errorText!.isNotEmpty;

    return FormField<String>(
      initialValue: controller?.text ?? '',
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (FormFieldState<String> field) {
        final showError = field.hasError || hasError;
        final errorMessage = field.errorText ?? errorText;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height,
              child: TextField(
                controller: controller,
                readOnly: readOnly,
                onTap: onTap,
                keyboardType: keyboardType,
                inputFormatters: inputFormatters,
                onChanged: (value) => field.didChange(value),
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
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 40,
                    minHeight: 24,
                  ),
                  prefixIcon: leadingIcon != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: AppSpacing.md),
                          child: leadingIconColor != null
                              ? IconTheme(
                                  data: IconThemeData(color: leadingIconColor),
                                  child: leadingIcon!,
                                )
                              : leadingIcon,
                        )
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
                      color: showError
                          ? CustomAppColors.error
                          : CustomAppColors.formBorder,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: showError
                          ? CustomAppColors.error
                          : CustomAppColors.formBorder,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            if (showError &&
                errorMessage != null &&
                errorMessage.isNotEmpty) ...[
              const VerticalSpace(AppSpacing.sm),
              Text(
                errorMessage,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: CustomAppColors.error,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
