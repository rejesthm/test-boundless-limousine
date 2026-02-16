import 'package:test_repo_example/common/extensions/responsive_extension.dart';
import 'package:test_repo_example/common/extensions/text_extension.dart';
import 'package:test_repo_example/common/styles/button_styles.dart';
import 'package:test_repo_example/common/widgets/buttons/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    required this.actionButtonTitle,
    this.title,
    this.subtitle,
    super.key,
    this.dialogWidth,
    this.buttonColor = CustomAppColors.primary,
    this.onActionButtonClick,
    this.onCancelClick,
    this.cancelButtonTitle,
    this.buttonWidth,
    this.borderRadius = 20,
  });

  final String? title;
  final String? subtitle;
  final String actionButtonTitle;
  final String? cancelButtonTitle;
  final Color? buttonColor;
  final VoidCallback? onActionButtonClick;
  final VoidCallback? onCancelClick;
  final double? buttonWidth;
  final double borderRadius;
  final double? dialogWidth;

  @override
  Widget build(BuildContext context) {
    final width = dialogWidth ?? context.width;

    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      insetPadding: EdgeInsets.zero,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),

      content: SizedBox(
        width: width < 315 ? double.infinity : 296,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null)
              Text(
                title!,
                style: context.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            if (subtitle != null) const SizedBox(height: 30),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  subtitle!,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: CustomAppColors.gray2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 40),
            SizedBox(
              width: buttonWidth ?? width,
              child: PrimaryButtonWidget(
                onPressed: onActionButtonClick,
                canonicalButtonName: 'Dialog Action Button',
                routeName: ModalRoute.of(context)?.settings.name ?? "Unknown",
                children: [Text(actionButtonTitle)],
              ),
            ),
            const SizedBox(height: 16),
            cancelButtonTitle != null
                ? Column(
                  children: [
                    onCancelClick != null
                        ? TextButton(
                          onPressed: onCancelClick ?? Navigator.of(context).pop,
                          child: Text(
                            "Cancel",
                            style: context.textTheme.bodyMedium!.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                        : SizedBox(
                          width: buttonWidth ?? width,
                          child: PrimaryButtonWidget(
                            style: ButtonStyles.whiteBordered,
                            onPressed:
                                onCancelClick ?? Navigator.of(context).pop,
                            canonicalButtonName: 'Dialog Cancel Button',
                            children: [Text(cancelButtonTitle ?? "Cancel")],
                          ),
                        ),
                  ],
                )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
