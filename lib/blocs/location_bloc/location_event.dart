part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class LocationSearchRequested extends LocationEvent {
  const LocationSearchRequested({
    required this.input,
    required this.fieldType,
    this.stopIndex,
  });

  final String input;
  final LocationFieldType fieldType;
  final int? stopIndex;

  @override
  List<Object?> get props => [input, fieldType, stopIndex];
}

class LocationSelected extends LocationEvent {
  const LocationSelected({
    required this.prediction,
    required this.fieldType,
    this.stopIndex,
  });

  final PlacePrediction prediction;
  final LocationFieldType fieldType;
  final int? stopIndex;

  @override
  List<Object?> get props => [prediction, fieldType, stopIndex];
}

class LocationSuggestionsCleared extends LocationEvent {
  const LocationSuggestionsCleared(this.fieldType, {this.stopIndex});

  final LocationFieldType fieldType;
  final int? stopIndex;

  @override
  List<Object?> get props => [fieldType, stopIndex];
}

class TravelTimeRequested extends LocationEvent {
  const TravelTimeRequested();
}

class StopAdded extends LocationEvent {
  const StopAdded();
}

class StopRemoved extends LocationEvent {
  const StopRemoved(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}
