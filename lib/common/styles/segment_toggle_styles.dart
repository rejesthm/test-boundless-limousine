import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:test_repo_example/common/styles/text_themes.dart';

class SegmentToggleStyles {
  SegmentToggleStyles._();

  static const double borderRadius = 8.0;
  static const double outerBorderWidth = 1.0;
  static const double selectedBorderWidth = 2.0;

  static const double segmentPaddingV = 14.0;
  static const double segmentPaddingH = 18.0;
  static const double iconTextGap = 8.0;

  static const double mediumHeight = 44.0;
  static const double mediumPaddingH = 12.0;
  static const double mediumPaddingV = 10.0;
  static const double mediumIconSize = 18.0;
  static const double mediumFontSize = 14.0;

  static const double smallHeight = 40.0;
  static const double smallBorderRadius = 8.0;
  static const double smallPaddingH = 12.0;

  static BoxDecoration containerDecoration = BoxDecoration(
    color: CustomAppColors.white,
    borderRadius: BorderRadius.circular(borderRadius),
    border: Border.all(
      color: CustomAppColors.toggleOuterBorder,
      width: outerBorderWidth,
    ),
  );

  static BoxDecoration selectedSegmentDecoration({
    required bool isLeftSegment,
    required bool isRightSegment,
  }) {
    return BoxDecoration(
      color: CustomAppColors.toggleSelectedBg,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(isLeftSegment ? borderRadius : 0),
        bottomLeft: Radius.circular(isLeftSegment ? borderRadius : 0),
        topRight: Radius.circular(isRightSegment ? borderRadius : 0),
        bottomRight: Radius.circular(isRightSegment ? borderRadius : 0),
      ),
      border: Border.all(
        color: CustomAppColors.toggleSelectedGold,
        width: selectedBorderWidth,
      ),
    );
  }

  static BoxDecoration unselectedSegmentDecoration({
    required bool isLeftSegment,
    required bool isRightSegment,
  }) {
    return BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(isLeftSegment ? borderRadius : 0),
        bottomLeft: Radius.circular(isLeftSegment ? borderRadius : 0),
        topRight: Radius.circular(isRightSegment ? borderRadius : 0),
        bottomRight: Radius.circular(isRightSegment ? borderRadius : 0),
      ),
    );
  }

  static BoxDecoration smallContainerDecoration = BoxDecoration(
    color: CustomAppColors.white,
    borderRadius: BorderRadius.circular(smallBorderRadius),
    border: Border.all(color: CustomAppColors.toggleOuterBorder, width: 1),
  );

  static BoxDecoration smallSelectedDecoration({
    required bool isLeftSegment,
    required bool isRightSegment,
  }) {
    const radius = 4.0;
    return BoxDecoration(
      color: CustomAppColors.toggleSelectedBg,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(isLeftSegment ? radius : 0),
        bottomLeft: Radius.circular(isLeftSegment ? radius : 0),
        topRight: Radius.circular(isRightSegment ? radius : 0),
        bottomRight: Radius.circular(isRightSegment ? radius : 0),
      ),
      border: Border.all(
        color: CustomAppColors.toggleSelectedGold,
        width: selectedBorderWidth,
      ),
    );
  }

  static TextStyle selectedTextStyle = TextThemes.defaultStyle.bodyMedium!
      .copyWith(
        color: CustomAppColors.toggleSelectedGold,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );

  static TextStyle unselectedTextStyle = TextThemes.defaultStyle.bodyMedium!
      .copyWith(
        color: CustomAppColors.formTextSecondary,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
}
