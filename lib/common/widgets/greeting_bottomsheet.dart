import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:test_repo_example/common/styles/app_spacing.dart';

void showGreetingBottomsheet(BuildContext context, String firstName) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: const BoxDecoration(
        color: CustomAppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hi $firstName!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: CustomAppColors.formTextPrimary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const VerticalSpace(AppSpacing.lg),
            Text(
              'Thanks for your booking. We\'ll be in touch soon.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: CustomAppColors.formTextSecondary,
                  ),
            ),
            const VerticalSpace(AppSpacing.xl),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomAppColors.toggleSelectedGold,
                  foregroundColor: CustomAppColors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
