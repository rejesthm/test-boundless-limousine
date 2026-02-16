import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_time_result.freezed.dart';

@freezed
class TravelTimeResult with _$TravelTimeResult {
  const TravelTimeResult._();

  const factory TravelTimeResult({
    required int durationMinutes,
    required String distanceText,
    required int distanceMeters,
  }) = _TravelTimeResult;

  String get durationText {
    if (durationMinutes < 60) {
      return '$durationMinutes min';
    }
    final hours = durationMinutes ~/ 60;
    final mins = durationMinutes % 60;
    if (mins == 0) {
      return '${hours}h';
    }
    return '${hours}h ${mins}min';
  }
}
