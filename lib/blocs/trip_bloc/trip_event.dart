part of 'trip_bloc.dart';

abstract class TripEvent extends Equatable {
  const TripEvent();

  @override
  List<Object?> get props => [];
}

class TripSubmit extends TripEvent {
  const TripSubmit({required this.payload});

  final Map<String, dynamic> payload;

  @override
  List<Object?> get props => [payload];
}

class TripContactInfoSaved extends TripEvent {
  const TripContactInfoSaved();
}
