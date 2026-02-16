import 'package:test_repo_example/common/utils/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final GetIt sl = GetIt.I;

class DependencyManager {
  bool initialized = false;

  DependencyManager() {
    _provideCore();
  }

  Future<void> init() async {
    await sl.allReady();
    initialized = true;
    debugPrint('DependencyManager initialized');
  }

  void _provideCore() {
    sl.registerLazySingleton<Logger>(() => Logger(printer: AppLogger()));
  }
}
