import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:test_repo_example/repositories/phone_contacts_repository.dart';
import 'package:test_repo_example/repositories/trip_repository.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  TripBloc({
    required TripRepository repository,
    required PhoneContactsRepository phoneContactsRepository,
  })  : _repository = repository,
        _phoneContactsRepository = phoneContactsRepository,
        super(const TripState()) {
    on<TripSubmit>(_onTripSubmit);
    on<TripContactInfoSaved>(_onTripContactInfoSaved);
  }

  final TripRepository _repository;
  final PhoneContactsRepository _phoneContactsRepository;

  Future<void> _onTripSubmit(
    TripSubmit event,
    Emitter<TripState> emit,
  ) async {
    emit(state.copyWith(status: TripStatus.loading));

    try {
      final result = await _repository.submitTrip(event.payload);
      final phone = event.payload['phone'] as String? ?? '';

      final contact = await _phoneContactsRepository.findByPhone(phone);

      if (contact != null) {
        emit(state.copyWith(
          status: TripStatus.success,
          response: result,
          recognizedFirstName: contact.firstName,
          needsContactInfo: false,
        ));
      } else {
        emit(state.copyWith(
          status: TripStatus.success,
          response: result,
          needsContactInfo: true,
          clearRecognizedFirstName: true,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: TripStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onTripContactInfoSaved(
    TripContactInfoSaved event,
    Emitter<TripState> emit,
  ) {
    emit(state.copyWith(needsContactInfo: false));
  }
}
