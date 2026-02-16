import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:test_repo_example/common/models/place_prediction/place_prediction.dart';
import 'package:test_repo_example/common/models/travel_time_result/travel_time_result.dart';
import 'package:test_repo_example/repositories/location_repository.dart';

part 'location_event.dart';
part 'location_state.dart';

enum LocationFieldType { pickup, dropoff, stop }

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({required LocationRepository repository})
    : _repository = repository,
      super(const LocationState()) {
    on<LocationSearchRequested>(
      _onLocationSearchRequested,
      transformer: restartable(),
    );
    on<LocationSelected>(_onLocationSelected);
    on<LocationSuggestionsCleared>(_onLocationSuggestionsCleared);
    on<TravelTimeRequested>(_onTravelTimeRequested);
    on<StopAdded>(_onStopAdded);
    on<StopRemoved>(_onStopRemoved);
  }

  final LocationRepository _repository;

  FutureOr<void> _onLocationSearchRequested(
    LocationSearchRequested event,
    Emitter<LocationState> emit,
  ) async {
    if (event.input.trim().isEmpty) {
      if (event.fieldType == LocationFieldType.pickup) {
        emit(state.copyWith(
          pickupPredictions: [],
          isSearchingPickup: false,
          locationError: null,
        ));
      } else if (event.fieldType == LocationFieldType.dropoff) {
        emit(state.copyWith(
          dropoffPredictions: [],
          isSearchingDropoff: false,
          locationError: null,
        ));
      } else if (event.stopIndex != null) {
        final updated = Map<int, List<PlacePrediction>>.from(state.stopPredictions);
        updated[event.stopIndex!] = [];
        emit(state.copyWith(
          stopPredictions: updated,
          clearSearchingStopIndex: true,
          locationError: null,
        ));
      }
      return;
    }

    if (event.fieldType == LocationFieldType.pickup) {
      emit(state.copyWith(isSearchingPickup: true, locationError: null));
    } else if (event.fieldType == LocationFieldType.dropoff) {
      emit(state.copyWith(isSearchingDropoff: true, locationError: null));
    } else if (event.stopIndex != null) {
      emit(state.copyWith(
        isSearchingStopIndex: event.stopIndex,
        locationError: null,
      ));
    }

    try {
      final predictions = await _repository.getPlacePredictions(event.input);

      if (event.fieldType == LocationFieldType.pickup) {
        emit(state.copyWith(
          pickupPredictions: predictions,
          isSearchingPickup: false,
          locationError: null,
        ));
      } else if (event.fieldType == LocationFieldType.dropoff) {
        emit(state.copyWith(
          dropoffPredictions: predictions,
          isSearchingDropoff: false,
          locationError: null,
        ));
      } else if (event.stopIndex != null) {
        final updated = Map<int, List<PlacePrediction>>.from(state.stopPredictions);
        updated[event.stopIndex!] = predictions;
        emit(state.copyWith(
          stopPredictions: updated,
          clearSearchingStopIndex: true,
          locationError: null,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isSearchingPickup: false,
        isSearchingDropoff: false,
        clearSearchingStopIndex: true,
        locationError: e.toString(),
      ));
    }
  }

  void _onLocationSelected(
    LocationSelected event,
    Emitter<LocationState> emit,
  ) {
    if (event.fieldType == LocationFieldType.pickup) {
      emit(state.copyWith(
        pickupPlace: event.prediction,
        pickupPredictions: [],
        travelTimeResult: null,
      ));
    } else if (event.fieldType == LocationFieldType.dropoff) {
      emit(state.copyWith(
        dropoffPlace: event.prediction,
        dropoffPredictions: [],
        travelTimeResult: null,
      ));
    } else if (event.stopIndex != null) {
      final stops = List<PlacePrediction?>.from(state.stopPlaces);
      while (stops.length <= event.stopIndex!) {
        stops.add(null);
      }
      stops[event.stopIndex!] = event.prediction;
      final updated = Map<int, List<PlacePrediction>>.from(state.stopPredictions);
      updated[event.stopIndex!] = [];
      emit(state.copyWith(
        stopPlaces: stops,
        stopPredictions: updated,
        clearSearchingStopIndex: true,
        travelTimeResult: null,
      ));
    }

    if (_hasAllLocations) {
      add(const TravelTimeRequested());
    }
  }

  bool get _hasAllLocations {
    if (state.pickupPlace == null || state.dropoffPlace == null) return false;
    for (var i = 0; i < state.stopPlaces.length; i++) {
      if (state.stopPlaces[i] == null) return false;
    }
    return true;
  }

  void _onStopAdded(StopAdded event, Emitter<LocationState> emit) {
    emit(state.copyWith(
      stopPlaces: [...state.stopPlaces, null],
      travelTimeResult: null,
    ));
  }

  void _onStopRemoved(StopRemoved event, Emitter<LocationState> emit) {
    final stops = List<PlacePrediction?>.from(state.stopPlaces);
    if (event.index >= 0 && event.index < stops.length) {
      stops.removeAt(event.index);
      final updated = <int, List<PlacePrediction>>{};
      for (final e in state.stopPredictions.entries) {
        if (e.key < event.index) {
          updated[e.key] = e.value;
        } else if (e.key > event.index) {
          updated[e.key - 1] = e.value;
        }
      }
      emit(state.copyWith(
        stopPlaces: stops,
        stopPredictions: updated,
        travelTimeResult: null,
      ));
      if (_hasAllLocations) add(const TravelTimeRequested());
    }
  }

  void _onLocationSuggestionsCleared(
    LocationSuggestionsCleared event,
    Emitter<LocationState> emit,
  ) {
    if (event.fieldType == LocationFieldType.pickup) {
      emit(state.copyWith(pickupPredictions: []));
    } else if (event.fieldType == LocationFieldType.dropoff) {
      emit(state.copyWith(dropoffPredictions: []));
    } else if (event.stopIndex != null) {
      final updated = Map<int, List<PlacePrediction>>.from(state.stopPredictions);
      updated[event.stopIndex!] = [];
      emit(state.copyWith(
        stopPredictions: updated,
        clearSearchingStopIndex: state.isSearchingStopIndex == event.stopIndex,
      ));
    }
  }

  FutureOr<void> _onTravelTimeRequested(
    TravelTimeRequested event,
    Emitter<LocationState> emit,
  ) async {
    final pickup = state.pickupPlace;
    final dropoff = state.dropoffPlace;

    if (pickup == null || dropoff == null) {
      return;
    }

    emit(state.copyWith(isCalculatingTravelTime: true, locationError: null));

    try {
      final origin = 'place_id:${pickup.placeId}';
      final destination = 'place_id:${dropoff.placeId}';
      final waypoints = state.stopPlaces
          .whereType<PlacePrediction>()
          .map((p) => 'place_id:${p.placeId}')
          .toList();

      final result = await _repository.getTravelTime(
        origin: origin,
        destination: destination,
        waypoints: waypoints,
      );

      emit(
        state.copyWith(
          travelTimeResult: result,
          isCalculatingTravelTime: false,
          locationError: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isCalculatingTravelTime: false,
          locationError: e.toString(),
        ),
      );
    }
  }
}
