import 'package:flutter/material.dart';
import 'package:test_repo_example/common/extensions/responsive_extension.dart';

class FormLayoutStyles {
  FormLayoutStyles._();

  static const double spaceAfterHeader = 24;
  static const double spaceAfterTitle = 24;
  static const double spaceAfterTripToggle = 28;
  static const double spaceBetweenSections = 28;
  static const double spaceWithinSection = 12;
  static const double spaceBeforeContinue = 40;

  static const double inputHeight = 48;
  static const double inputBorderRadius = 6;
  static const double inputBorderWidth = 1;

  static const double toggleBorderRadius = 6;
  static const double toggleInnerPadding = 4;
  static const double toggleSegmentPaddingV = 10;
  static const double toggleSegmentPaddingH = 16;

  static const double continueButtonHeight = 52;
  static const double continueButtonRadius = 8;

  static double scale(BuildContext context, double value) =>
      context.isTablet || context.isDesktop ? value * 1.25 : value;
}
