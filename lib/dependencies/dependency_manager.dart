import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'package:test_repo_example/common/utils/app_logger.dart';
import 'package:test_repo_example/database/app_database.dart';
import 'package:test_repo_example/env/env.dart';
import 'package:test_repo_example/repositories/location_repository.dart';
import 'package:test_repo_example/repositories/phone_contacts_repository.dart';
import 'package:test_repo_example/repositories/trip_repository.dart';

final GetIt sl = GetIt.I;

class DependencyManager {
  bool initialized = false;

  DependencyManager() {
    _provideCore();
  }

  Future<void> init() async {
    await AppDatabase.init(Env.appDatabaseName);
    await sl.allReady();
    initialized = true;
    debugPrint('DependencyManager initialized');
  }

  void _provideCore() {
    sl.registerLazySingleton<Logger>(() => Logger(printer: AppLogger()));

    sl.registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: Env.googleMapsBaseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      ),
      instanceName: 'maps',
    );
    sl.registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: Env.tripApiBaseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      ),
      instanceName: 'trip',
    );

    sl.registerLazySingleton<LocationRepository>(
      () => LocationRepository(dio: sl<Dio>(instanceName: 'maps')),
    );
    sl.registerLazySingleton<TripRepository>(
      () => TripRepository(dio: sl<Dio>(instanceName: 'trip')),
    );
    sl.registerLazySingleton<PhoneContactsRepository>(
      () => PhoneContactsRepository(),
    );
  }
}
