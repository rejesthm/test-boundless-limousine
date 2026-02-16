import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_prediction.freezed.dart';

@freezed
class PlacePrediction with _$PlacePrediction {
  const PlacePrediction._();

  const factory PlacePrediction({
    required String placeId,
    required String description,
    String? mainText,
    String? secondaryText,
  }) = _PlacePrediction;

  factory PlacePrediction.fromJson(Map<String, dynamic> json) {
    final structured = json['structured_formatting'] as Map<String, dynamic>?;
    return PlacePrediction(
      placeId: json['place_id'] as String,
      description: json['description'] as String,
      mainText: structured?['main_text'] as String?,
      secondaryText: structured?['secondary_text'] as String?,
    );
  }
}
