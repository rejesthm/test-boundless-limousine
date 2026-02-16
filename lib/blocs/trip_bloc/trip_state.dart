part of 'trip_bloc.dart';

enum TripStatus { initial, loading, success, failure }

class TripState extends Equatable {
  const TripState({
    this.status = TripStatus.initial,
    this.response,
    this.errorMessage,
    this.recognizedFirstName,
    this.needsContactInfo = false,
  });

  final TripStatus status;
  final Map<String, dynamic>? response;
  final String? errorMessage;
  final String? recognizedFirstName;
  final bool needsContactInfo;

  bool get isLoading => status == TripStatus.loading;
  bool get isSuccess => status == TripStatus.success;
  bool get isFailure => status == TripStatus.failure;

  @override
  List<Object?> get props => [
        status,
        response,
        errorMessage,
        recognizedFirstName,
        needsContactInfo,
      ];

  TripState copyWith({
    TripStatus? status,
    Map<String, dynamic>? response,
    String? errorMessage,
    String? recognizedFirstName,
    bool clearRecognizedFirstName = false,
    bool? needsContactInfo,
  }) {
    return TripState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
      recognizedFirstName: clearRecognizedFirstName
          ? null
          : (recognizedFirstName ?? this.recognizedFirstName),
      needsContactInfo: needsContactInfo ?? this.needsContactInfo,
    );
  }
}
