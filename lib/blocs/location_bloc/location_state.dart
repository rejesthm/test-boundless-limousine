part of 'location_bloc.dart';

class LocationState extends Equatable {
  const LocationState({
    this.pickupPredictions = const [],
    this.dropoffPredictions = const [],
    this.stopPredictions = const {},
    this.isSearchingPickup = false,
    this.isSearchingDropoff = false,
    this.isSearchingStopIndex,
    this.pickupPlace,
    this.dropoffPlace,
    this.stopPlaces = const [],
    this.travelTimeResult,
    this.isCalculatingTravelTime = false,
    this.locationError,
  });

  final List<PlacePrediction> pickupPredictions;
  final List<PlacePrediction> dropoffPredictions;
  final Map<int, List<PlacePrediction>> stopPredictions;
  final bool isSearchingPickup;
  final bool isSearchingDropoff;
  final int? isSearchingStopIndex;
  final PlacePrediction? pickupPlace;
  final PlacePrediction? dropoffPlace;
  final List<PlacePrediction?> stopPlaces;
  final TravelTimeResult? travelTimeResult;
  final bool isCalculatingTravelTime;
  final String? locationError;

  @override
  List<Object?> get props => [
        pickupPredictions,
        dropoffPredictions,
        stopPredictions,
        isSearchingPickup,
        isSearchingDropoff,
        isSearchingStopIndex,
        pickupPlace,
        dropoffPlace,
        stopPlaces,
        travelTimeResult,
        isCalculatingTravelTime,
        locationError,
      ];

  LocationState copyWith({
    List<PlacePrediction>? pickupPredictions,
    List<PlacePrediction>? dropoffPredictions,
    Map<int, List<PlacePrediction>>? stopPredictions,
    bool? isSearchingPickup,
    bool? isSearchingDropoff,
    int? isSearchingStopIndex,
    bool clearSearchingStopIndex = false,
    PlacePrediction? pickupPlace,
    PlacePrediction? dropoffPlace,
    List<PlacePrediction?>? stopPlaces,
    TravelTimeResult? travelTimeResult,
    bool? isCalculatingTravelTime,
    String? locationError,
  }) {
    return LocationState(
      pickupPredictions: pickupPredictions ?? this.pickupPredictions,
      dropoffPredictions: dropoffPredictions ?? this.dropoffPredictions,
      stopPredictions: stopPredictions ?? this.stopPredictions,
      isSearchingPickup: isSearchingPickup ?? this.isSearchingPickup,
      isSearchingDropoff: isSearchingDropoff ?? this.isSearchingDropoff,
      isSearchingStopIndex: clearSearchingStopIndex
          ? null
          : (isSearchingStopIndex ?? this.isSearchingStopIndex),
      pickupPlace: pickupPlace ?? this.pickupPlace,
      dropoffPlace: dropoffPlace ?? this.dropoffPlace,
      stopPlaces: stopPlaces ?? this.stopPlaces,
      travelTimeResult: travelTimeResult ?? this.travelTimeResult,
      isCalculatingTravelTime:
          isCalculatingTravelTime ?? this.isCalculatingTravelTime,
      locationError: locationError ?? this.locationError,
    );
  }
}
