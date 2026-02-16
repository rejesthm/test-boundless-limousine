import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:test_repo_example/common/styles/app_spacing.dart';
import 'package:test_repo_example/common/styles/segment_toggle_styles.dart';

enum SegmentControlSize { large, medium }

class AppSegmentedControl extends StatelessWidget {
  const AppSegmentedControl({
    super.key,
    required this.labels,
    this.icons = const [],
    required this.selectedIndex,
    required this.onChanged,
    this.compact = false,
    this.size = SegmentControlSize.large,
  });

  final List<String> labels;
  final List<IconData> icons;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final bool compact;
  final SegmentControlSize size;

  bool get _isCompact => compact;

  double get _height => SegmentToggleStyles.mediumHeight;

  BoxDecoration get _containerDecoration => _isCompact
      ? SegmentToggleStyles.smallContainerDecoration
      : SegmentToggleStyles.containerDecoration;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: _height,
        decoration: _containerDecoration,
        child: _isCompact
            ? IntrinsicWidth(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < labels.length; i++) ...[
                      if (i > 0)
                        Container(
                          width: 1,
                          color: CustomAppColors.toggleOuterBorder,
                        ),
                      _Segment(
                        index: i,
                        label: labels[i],
                        icon: icons.isNotEmpty ? icons[i] : null,
                        isSelected: selectedIndex == i,
                        isLeftSegment: i == 0,
                        isRightSegment: i == labels.length - 1,
                        compact: _isCompact,
                        size: size,
                        onTap: () => onChanged(i),
                      ),
                    ],
                  ],
                ),
              )
            : Row(
                children: [
                  for (int i = 0; i < labels.length; i++) ...[
                    if (i > 0)
                      Container(
                        width: 1,
                        color: CustomAppColors.toggleOuterBorder,
                      ),
                    _Segment(
                      index: i,
                      label: labels[i],
                      icon: icons.isNotEmpty ? icons[i] : null,
                      isSelected: selectedIndex == i,
                      isLeftSegment: i == 0,
                      isRightSegment: i == labels.length - 1,
                      compact: _isCompact,
                      size: size,
                      onTap: () => onChanged(i),
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.index,
    required this.label,
    this.icon,
    required this.isSelected,
    required this.isLeftSegment,
    required this.isRightSegment,
    required this.compact,
    required this.size,
    required this.onTap,
  });

  final int index;
  final String label;
  final IconData? icon;
  final bool isSelected;
  final bool isLeftSegment;
  final bool isRightSegment;
  final bool compact;
  final SegmentControlSize size;
  final VoidCallback onTap;

  bool get _useMedium => size == SegmentControlSize.medium && !compact;

  @override
  Widget build(BuildContext context) {
    final paddingH = compact
        ? SegmentToggleStyles.smallPaddingH
        : (_useMedium
              ? SegmentToggleStyles.mediumPaddingH
              : SegmentToggleStyles.segmentPaddingH);
    final paddingV = compact
        ? 8.0
        : (_useMedium
              ? SegmentToggleStyles.mediumPaddingV
              : SegmentToggleStyles.segmentPaddingV);
    final iconSize = compact
        ? 18.0
        : (_useMedium ? SegmentToggleStyles.mediumIconSize : 20.0);
    final fontSize = compact
        ? 14.0
        : (_useMedium ? SegmentToggleStyles.mediumFontSize : 16.0);
    final cornerRadius = 0.0;

    final content = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isLeftSegment ? cornerRadius : 0),
          bottomLeft: Radius.circular(isLeftSegment ? cornerRadius : 0),
          topRight: Radius.circular(isRightSegment ? cornerRadius : 0),
          bottomRight: Radius.circular(isRightSegment ? cornerRadius : 0),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(
            horizontal: paddingH,
            vertical: paddingV,
          ),
          decoration: isSelected
              ? (compact
                    ? SegmentToggleStyles.smallSelectedDecoration(
                        isLeftSegment: isLeftSegment,
                        isRightSegment: isRightSegment,
                      )
                    : SegmentToggleStyles.selectedSegmentDecoration(
                        isLeftSegment: isLeftSegment,
                        isRightSegment: isRightSegment,
                      ))
              : SegmentToggleStyles.unselectedSegmentDecoration(
                  isLeftSegment: isLeftSegment,
                  isRightSegment: isRightSegment,
                ),
          child: Row(
            mainAxisSize: compact ? MainAxisSize.min : MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: iconSize,
                  color: isSelected
                      ? CustomAppColors.toggleSelectedGold
                      : CustomAppColors.formTextSecondary,
                ),
                const HorizontalSpace(SegmentToggleStyles.iconTextGap),
              ],
              Text(
                label,
                style: isSelected
                    ? SegmentToggleStyles.selectedTextStyle.copyWith(
                        fontSize: fontSize,
                      )
                    : SegmentToggleStyles.unselectedTextStyle.copyWith(
                        fontSize: fontSize,
                      ),
              ),
            ],
          ),
        ),
      ),
    );

    return compact ? content : Expanded(child: content);
  }
}
