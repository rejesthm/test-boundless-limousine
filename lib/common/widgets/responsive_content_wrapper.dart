import 'package:flutter/material.dart';
import 'package:test_repo_example/common/extensions/responsive_extension.dart';

class ResponsiveContentWrapper extends StatelessWidget {
  const ResponsiveContentWrapper({
    super.key,
    required this.child,
    this.maxWidth = 480,
    this.align = Alignment.topCenter,
  });

  final Widget child;
  final double maxWidth;
  final Alignment align;

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return child;
    }
    return Align(
      alignment: align,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
