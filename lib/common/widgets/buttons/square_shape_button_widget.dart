import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:flutter/material.dart';

class SquareShapeButtonWidget extends StatelessWidget {
  final double size;
  final IconData icon;
  final EdgeInsets? padding;
  final VoidCallback onPressed;

  const SquareShapeButtonWidget({
    super.key,
    this.size = 48,
    required this.icon,
    this.padding = const EdgeInsets.all(8),
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: CustomAppColors.primary),
        ),
        child: Row(
          children: [Icon(icon, color: CustomAppColors.primary, size: size)],
        ),
      ),
    );
  }
}
