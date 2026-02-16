import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_repo_example/common/styles/app_colors.dart';
import 'package:test_repo_example/common/styles/app_spacing.dart';
import 'package:test_repo_example/blocs/location_bloc/location_bloc.dart';
import 'package:test_repo_example/common/models/place_prediction/place_prediction.dart';

class LocationAutocompleteField extends StatefulWidget {
  const LocationAutocompleteField({
    super.key,
    required this.controller,
    required this.fieldType,
    this.stopIndex,
    this.labelText = 'Location',
    this.focusNode,
    this.validator,
  });

  final TextEditingController controller;
  final LocationFieldType fieldType;
  final int? stopIndex;
  final String labelText;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  @override
  State<LocationAutocompleteField> createState() =>
      _LocationAutocompleteFieldState();
}

class _LocationAutocompleteFieldState extends State<LocationAutocompleteField> {
  final _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  Timer? _debounce;
  static const _debounceDuration = Duration(milliseconds: 400);
  bool _isSelectingPrediction = false;

  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    widget.controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    _focusNode.removeListener(_onFocusChanged);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _debounce?.cancel();
    _removeOverlay();
    super.dispose();
  }

  void _onTextChanged() {
    if (_isSelectingPrediction) return;
    _debounce?.cancel();
    _debounce = Timer(_debounceDuration, () {
      if (!mounted) return;
      context.read<LocationBloc>().add(
        LocationSearchRequested(
          input: widget.controller.text,
          fieldType: widget.fieldType,
          stopIndex: widget.stopIndex,
        ),
      );
    });
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (!mounted) return;
        context.read<LocationBloc>().add(
          LocationSuggestionsCleared(
            widget.fieldType,
            stopIndex: widget.stopIndex,
          ),
        );
      });
    }
  }

  List<PlacePrediction> _getPredictions(LocationState state) {
    if (widget.fieldType == LocationFieldType.pickup) {
      return state.pickupPredictions;
    }
    if (widget.fieldType == LocationFieldType.dropoff) {
      return state.dropoffPredictions;
    }
    if (widget.stopIndex != null) {
      return state.stopPredictions[widget.stopIndex!] ?? [];
    }
    return [];
  }

  bool _isSearching(LocationState state) {
    if (widget.fieldType == LocationFieldType.pickup) {
      return state.isSearchingPickup;
    }
    if (widget.fieldType == LocationFieldType.dropoff) {
      return state.isSearchingDropoff;
    }
    return state.isSearchingStopIndex == widget.stopIndex;
  }

  void _selectPrediction(PlacePrediction prediction) {
    _isSelectingPrediction = true;
    widget.controller.text = prediction.description;
    widget.controller.selection = TextSelection.fromPosition(
      TextPosition(offset: prediction.description.length),
    );
    final bloc = context.read<LocationBloc>();
    bloc.add(
      LocationSelected(
        prediction: prediction,
        fieldType: widget.fieldType,
        stopIndex: widget.stopIndex,
      ),
    );
    if (widget.fieldType == LocationFieldType.stop &&
        widget.stopIndex != null) {
      bloc.add(
        LocationSearchRequested(
          input: '',
          fieldType: LocationFieldType.stop,
          stopIndex: widget.stopIndex,
        ),
      );
    }
    _removeOverlay();
    Future.microtask(() => _isSelectingPrediction = false);
  }

  void _showOverlay(List<PlacePrediction> predictions, BuildContext context) {
    _removeOverlay();

    if (predictions.isEmpty) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => _SuggestionsOverlay(
        layerLink: _layerLink,
        predictions: predictions,
        onSelect: _selectPrediction,
        onTapOutside: _removeOverlay,
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: BlocConsumer<LocationBloc, LocationState>(
        listenWhen: (prev, curr) {
          final prevList = _getPredictions(prev);
          final currList = _getPredictions(curr);
          return prevList != currList;
        },
        buildWhen: (prev, curr) {
          final prevSearching = _isSearching(prev);
          final currSearching = _isSearching(curr);
          final prevPreds = _getPredictions(prev);
          final currPreds = _getPredictions(curr);
          return prevSearching != currSearching || prevPreds != currPreds;
        },
        listener: (context, state) {
          final predictions = _getPredictions(state);
          if (predictions.isNotEmpty) {
            _showOverlay(predictions, context);
          } else {
            _removeOverlay();
          }
        },
        builder: (context, state) {
          final theme = Theme.of(context);
          final isSearching = _isSearching(state);

          return FormField<String>(
            initialValue: widget.controller.text,
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            builder: (FormFieldState<String> field) {
              final showError = field.hasError;
              final errorMessage = field.errorText;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 56,
                    child: TextField(
                      controller: widget.controller,
                      focusNode: _focusNode,
                      onChanged: (value) => field.didChange(value),
                      onTap: () {
                        if (widget.controller.text.isNotEmpty) {
                          context.read<LocationBloc>().add(
                            LocationSearchRequested(
                              input: widget.controller.text,
                              fieldType: widget.fieldType,
                              stopIndex: widget.stopIndex,
                            ),
                          );
                        }
                      },
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: CustomAppColors.formTextPrimary,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Select location',
                        labelText: widget.labelText,
                        labelStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: CustomAppColors.formTextHint,
                        ),
                        floatingLabelStyle: theme.textTheme.bodySmall?.copyWith(
                          color: CustomAppColors.formTextHint,
                          fontSize: 12,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 24,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: AppSpacing.md),
                          child: Icon(
                            Icons.location_on,
                            color: CustomAppColors.toggleSelectedGold,
                            size: 20,
                          ),
                        ),
                        suffixIcon: SizedBox(
                          width: 24,
                          height: 24,
                          child: isSearching
                              ? Center(
                                  child: SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: CustomAppColors.formTextHint,
                                    ),
                                  ),
                                )
                              : Icon(
                                  Icons.arrow_drop_down,
                                  color: CustomAppColors.formTextHint,
                                  size: 24,
                                ),
                        ),
                        filled: true,
                        fillColor: CustomAppColors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.md,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: CustomAppColors.formBorder,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: showError
                                ? CustomAppColors.error
                                : CustomAppColors.formBorder,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: showError
                                ? CustomAppColors.error
                                : CustomAppColors.formBorder,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (showError &&
                      errorMessage != null &&
                      errorMessage.isNotEmpty) ...[
                    const VerticalSpace(AppSpacing.sm),
                    Text(
                      errorMessage,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: CustomAppColors.error,
                      ),
                    ),
                  ],
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _SuggestionsOverlay extends StatelessWidget {
  const _SuggestionsOverlay({
    required this.layerLink,
    required this.predictions,
    required this.onSelect,
    required this.onTapOutside,
  });

  final LayerLink layerLink;
  final List<PlacePrediction> predictions;
  final ValueChanged<PlacePrediction> onSelect;
  final VoidCallback onTapOutside;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: onTapOutside,
            behavior: HitTestBehavior.opaque,
          ),
        ),
        CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 60),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            color: CustomAppColors.white,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 250),
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: predictions.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final prediction = predictions[index];
                  return ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: CustomAppColors.toggleSelectedGold,
                      size: 20,
                    ),
                    title: Text(
                      prediction.description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: CustomAppColors.formTextPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () => onSelect(prediction),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
