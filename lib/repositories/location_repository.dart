import 'package:dio/dio.dart';

import 'package:test_repo_example/config/app_config.dart';
import 'package:test_repo_example/env/env.dart';
import 'package:test_repo_example/common/models/place_prediction/place_prediction.dart';
import 'package:test_repo_example/common/models/travel_time_result/travel_time_result.dart';

class LocationRepository {
  LocationRepository({
    Dio? dio,
    String? apiKey,
  })  : _dio = dio ?? Dio(BaseOptions(baseUrl: Env.googleMapsBaseUrl)),
        _apiKey = apiKey ?? AppConfig.googleMapsApiKey;

  final Dio _dio;
  final String _apiKey;

  static const _placesPath = '/place/autocomplete/json';
  static const _directionsPath = '/directions/json';

  Future<List<PlacePrediction>> getPlacePredictions(String input) async {
    if (input.trim().isEmpty) {
      return [];
    }

    final response = await _dio.get<Map<String, dynamic>>(
      _placesPath,
      queryParameters: {
        'input': input,
        'key': _apiKey,
        'types': 'establishment|geocode',
      },
    );

    if (response.statusCode != 200) {
      throw LocationRepositoryException(
        'Places API error: ${response.statusCode}',
      );
    }

    final json = response.data;
    final status = (json ?? {})['status'] as String?;

    if (status != 'OK' && status != 'ZERO_RESULTS') {
      throw LocationRepositoryException('Places API status: $status');
    }

    final predictions = (json ?? {})['predictions'] as List<dynamic>? ?? [];
    return predictions
        .map((e) => PlacePrediction.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<TravelTimeResult?> getTravelTime({
    required String origin,
    required String destination,
    List<String> waypoints = const [],
  }) async {
    final params = <String, dynamic>{
      'origin': origin,
      'destination': destination,
      'key': _apiKey,
      'mode': 'driving',
    };
    if (waypoints.isNotEmpty) {
      params['waypoints'] = waypoints.join('|');
    }

    final response = await _dio.get<Map<String, dynamic>>(
      _directionsPath,
      queryParameters: params,
    );

    if (response.statusCode != 200) {
      throw LocationRepositoryException(
        'Directions API error: ${response.statusCode}',
      );
    }

    final json = response.data;
    final status = (json ?? {})['status'] as String?;

    if (status != 'OK') {
      if (status == 'ZERO_RESULTS') {
        return null;
      }
      throw LocationRepositoryException('Directions API status: $status');
    }

    final routes = (json ?? {})['routes'] as List<dynamic>?;
    if (routes == null || routes.isEmpty) {
      return null;
    }

    final route = routes.first as Map<String, dynamic>;
    final legs = route['legs'] as List<dynamic>?;
    if (legs == null || legs.isEmpty) {
      return null;
    }

    var totalDurationSeconds = 0;
    var totalDistanceMeters = 0;
    final distanceTexts = <String>[];

    for (final leg in legs) {
      final legMap = leg as Map<String, dynamic>;
      final duration = legMap['duration'] as Map<String, dynamic>?;
      final distance = legMap['distance'] as Map<String, dynamic>?;
      if (duration != null) {
        totalDurationSeconds += duration['value'] as int? ?? 0;
      }
      if (distance != null) {
        totalDistanceMeters += distance['value'] as int? ?? 0;
        distanceTexts.add(distance['text'] as String? ?? '');
      }
    }

    return TravelTimeResult(
      durationMinutes: (totalDurationSeconds / 60).round(),
      distanceText: _formatTotalDistance(totalDistanceMeters),
      distanceMeters: totalDistanceMeters,
    );
  }

  static String _formatTotalDistance(int meters) {
    if (meters < 1000) return '$meters m';
    final km = (meters / 1000).toStringAsFixed(1);
    return '$km km';
  }
}

class LocationRepositoryException implements Exception {
  LocationRepositoryException(this.message);
  final String message;

  @override
  String toString() => 'LocationRepositoryException: $message';
}
