import 'package:flutter/material.dart';
import 'package:test_repo_example/common/models/responsive/responsive.dart';

extension ResponsiveExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  bool get isMobile => width < 650;
  bool get isTablet => width >= 650 && width < 1024;
  bool get isDesktop => width >= 1024;

  double get mobile => 650;
  double get tablet => 1024;

  Responsive get responsive {
    if (isMobile) {
      return const Responsive.isMobile();
    } else if (isTablet) {
      return const Responsive.isTablet();
    } else {
      return const Responsive.isDesktop();
    }
  }
}
