import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:test_repo_example/common/styles/app_spacing.dart';
import 'package:test_repo_example/common/widgets/app_segmented_control.dart';
import 'package:test_repo_example/common/widgets/section_title.dart';
import 'package:test_repo_example/blocs/location_bloc/location_bloc.dart';
import 'package:test_repo_example/common/widgets/location_autocomplete_field.dart';

class PickupAndDropoffWidget extends StatefulWidget {
  const PickupAndDropoffWidget({
    super.key,
    required this.dateController,
    required this.timeController,
    required this.pickupLocationController,
    required this.dropOffLocationController,
    required this.pickupLocationTypeIndex,
    required this.dropOffLocationTypeIndex,
    required this.onPickupLocationTypeChanged,
    required this.onDropOffLocationTypeChanged,
    required this.onDateTap,
    required this.onTimeTap,
  });

  final TextEditingController dateController;
  final TextEditingController timeController;
  final TextEditingController pickupLocationController;
  final TextEditingController dropOffLocationController;
  final int pickupLocationTypeIndex;
  final int dropOffLocationTypeIndex;
  final ValueChanged<int> onPickupLocationTypeChanged;
  final ValueChanged<int> onDropOffLocationTypeChanged;
  final VoidCallback onDateTap;
  final VoidCallback onTimeTap;

  @override
  State<PickupAndDropoffWidget> createState() => _PickupAndDropoffWidgetState();
}

class _PickupAndDropoffWidgetState extends State<PickupAndDropoffWidget> {
  final _stopControllers = <TextEditingController>[];

  @override
  void dispose() {
    for (final c in _stopControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _addStop() {
    setState(() {
      _stopControllers.add(TextEditingController());
    });
    context.read<LocationBloc>().add(const StopAdded());
  }

  void _removeStop(int index) {
    _stopControllers[index].dispose();
    setState(() {
      _stopControllers.removeAt(index);
    });
    context.read<LocationBloc>().add(StopRemoved(index));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPickupSection(context, theme),
        const VerticalSpace(AppSpacing.xl),
        _buildDropOffSection(context),
      ],
    );
  }

  Widget _buildPickupSection(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Pickup'),
        const VerticalSpace(AppSpacing.lg),
        Row(
          children: [
            Expanded(child: _buildDateField(context, theme)),
            const HorizontalSpace(AppSpacing.lg),
            Expanded(child: _buildTimeField(context, theme)),
          ],
        ),
        const VerticalSpace(AppSpacing.lg),
        AppSegmentedControl(
          labels: const ['Location', 'Airport'],
          selectedIndex: widget.pickupLocationTypeIndex,
          onChanged: widget.onPickupLocationTypeChanged,
          compact: true,
        ),
        const VerticalSpace(AppSpacing.lg),
        LocationAutocompleteField(
          controller: widget.pickupLocationController,
          fieldType: LocationFieldType.pickup,
          labelText: 'Location',
        ),
        ...List.generate(_stopControllers.length, (i) {
          return Padding(
            padding: const EdgeInsets.only(top: AppSpacing.lg),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: LocationAutocompleteField(
                    controller: _stopControllers[i],
                    fieldType: LocationFieldType.stop,
                    stopIndex: i,
                    labelText: 'Stop ${i + 1}',
                  ),
                ),
                const HorizontalSpace(AppSpacing.sm),
                IconButton(
                  onPressed: () => _removeStop(i),
                  icon: Icon(
                    Icons.close,
                    size: 20,
                    color: CustomAppColors.formTextHint,
                  ),
                  style: IconButton.styleFrom(
                    minimumSize: const Size(40, 40),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          );
        }),
        const VerticalSpace(AppSpacing.sm),
        GestureDetector(
          onTap: _addStop,
          child: Row(
            children: [
              Icon(
                Icons.add_circle_outline,
                size: 20,
                color: CustomAppColors.toggleSelectedGold,
              ),
              const HorizontalSpace(AppSpacing.sm),
              Text(
                'Add a stop',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: CustomAppColors.toggleSelectedGold,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateField(BuildContext context, ThemeData theme) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onDateTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: CustomAppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: CustomAppColors.formBorder, width: 1),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: CustomAppColors.toggleSelectedGold,
                size: 22,
              ),
              const HorizontalSpace(AppSpacing.md),
              Expanded(
                child: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: widget.dateController,
                  builder: (_, value, __) => Text(
                    value.text.isEmpty ? 'Select date' : value.text,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: value.text.isEmpty
                          ? CustomAppColors.formTextHint
                          : CustomAppColors.formTextPrimary,
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: CustomAppColors.formTextHint,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeField(BuildContext context, ThemeData theme) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTimeTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: CustomAppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: CustomAppColors.formBorder, width: 1),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            children: [
              Icon(
                Icons.schedule_outlined,
                color: CustomAppColors.toggleSelectedGold,
                size: 22,
              ),
              const HorizontalSpace(AppSpacing.md),
              Expanded(
                child: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: widget.timeController,
                  builder: (_, value, __) => Text(
                    value.text.isEmpty ? 'Select time' : value.text,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: value.text.isEmpty
                          ? CustomAppColors.formTextHint
                          : CustomAppColors.formTextPrimary,
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: CustomAppColors.formTextHint,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropOffSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Drop off'),
        const VerticalSpace(AppSpacing.lg),
        AppSegmentedControl(
          labels: const ['Location', 'Airport'],
          selectedIndex: widget.dropOffLocationTypeIndex,
          onChanged: widget.onDropOffLocationTypeChanged,
          compact: true,
        ),
        const VerticalSpace(AppSpacing.lg),
        LocationAutocompleteField(
          controller: widget.dropOffLocationController,
          fieldType: LocationFieldType.dropoff,
          labelText: 'Location',
        ),
        const VerticalSpace(AppSpacing.lg),
        BlocBuilder<LocationBloc, LocationState>(
          buildWhen: (prev, curr) =>
              prev.travelTimeResult != curr.travelTimeResult ||
              prev.isCalculatingTravelTime != curr.isCalculatingTravelTime,
          builder: (context, state) {
            if (state.isCalculatingTravelTime) {
              return Row(
                children: [
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  const HorizontalSpace(AppSpacing.sm),
                  Text(
                    'Calculating travel time...',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: CustomAppColors.formTextHint,
                    ),
                  ),
                ],
              );
            }
            final result = state.travelTimeResult;
            if (result == null) return const SizedBox.shrink();
            return Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: CustomAppColors.toggleSelectedBg,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: CustomAppColors.toggleSelectedGold,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.directions_car,
                    color: CustomAppColors.toggleSelectedGold,
                    size: 24,
                  ),
                  const HorizontalSpace(AppSpacing.md),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Total estimated time',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: CustomAppColors.formTextSecondary,
                        ),
                      ),
                      Text(
                        '${result.durationText} • ${result.distanceText}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: CustomAppColors.formTextPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
