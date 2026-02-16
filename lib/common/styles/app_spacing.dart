import 'package:test_repo_example/common/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 40;

  static const double space0 = 0;
  static const double space1 = 1;
  static const double space2 = 2;
  static const double space4 = 4;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space28 = 28;
  static const double space32 = 32;
  static const double space36 = 36;
  static const double space40 = 40;
  static const double space44 = 44;
  static const double space48 = 48;
  static const double space52 = 52;
  static const double space64 = 64;
  static const double space72 = 72;
  static const double space80 = 80;
  static const double space96 = 96;
  static const double space128 = 128;
  static const double space256 = 256;

  static EdgeInsets all(double value) => EdgeInsets.all(value);

  static EdgeInsets horizontal(double value) =>
      EdgeInsets.symmetric(horizontal: value);

  static EdgeInsets vertical(double value) =>
      EdgeInsets.symmetric(vertical: value);

  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      );

  static double _scaleFactor(BuildContext context) {
    return context.isTablet || context.isDesktop ? 1.25 : 1.0;
  }

  static double scale(BuildContext context, double value) {
    return value * _scaleFactor(context);
  }

  static EdgeInsets allResponsive(BuildContext context, double value) {
    return EdgeInsets.all(scale(context, value));
  }

  static EdgeInsets horizontalResponsive(BuildContext context, double value) {
    return EdgeInsets.symmetric(horizontal: scale(context, value));
  }

  static EdgeInsets verticalResponsive(BuildContext context, double value) {
    return EdgeInsets.symmetric(vertical: scale(context, value));
  }
}

class VerticalSpace extends SizedBox {
  const VerticalSpace(double height, {super.key}) : super(height: height);
}

class HorizontalSpace extends SizedBox {
  const HorizontalSpace(double width, {super.key}) : super(width: width);
}
