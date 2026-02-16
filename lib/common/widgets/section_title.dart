import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      style: theme.textTheme.titleMedium?.copyWith(
        color: CustomAppColors.formTextPrimary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
