import 'package:dio/dio.dart';

import 'package:test_repo_example/env/env.dart';

class TripRepository {
  TripRepository({Dio? dio})
    : _dio = dio ?? Dio(BaseOptions(baseUrl: Env.tripApiBaseUrl));

  final Dio _dio;

  Future<Map<String, dynamic>> submitTrip(Map<String, dynamic> payload) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/posts',
      data: payload,
      options: Options(contentType: Headers.jsonContentType),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw TripRepositoryException('Trip API error: ${response.statusCode}');
    }

    final data = response.data;
    if (data == null) {
      throw TripRepositoryException('Trip API returned empty response');
    }
    return data;
  }
}

class TripRepositoryException implements Exception {
  TripRepositoryException(this.message);
  final String message;

  @override
  String toString() => 'TripRepositoryException: $message';
}
