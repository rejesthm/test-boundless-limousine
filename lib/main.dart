import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_repo_example/common/styles/app_themes.dart';
import 'package:test_repo_example/common/utils/app_responsive.dart';
import 'package:test_repo_example/common/utils/context_utils.dart';
import 'package:test_repo_example/dependencies/dependency_manager.dart';
import 'package:test_repo_example/blocs/location_bloc/location_bloc.dart';
import 'package:test_repo_example/blocs/trip_bloc/trip_bloc.dart';
import 'package:test_repo_example/repositories/location_repository.dart';
import 'package:test_repo_example/repositories/phone_contacts_repository.dart';
import 'package:test_repo_example/repositories/trip_repository.dart';
import 'package:test_repo_example/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dm = DependencyManager();
  await dm.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppResponsive(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test',
        theme: AppThemes.defaultStyle,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<LocationBloc>(
              create: (_) => LocationBloc(repository: sl<LocationRepository>()),
            ),
            BlocProvider<TripBloc>(
              create: (_) => TripBloc(
                repository: sl<TripRepository>(),
                phoneContactsRepository: sl<PhoneContactsRepository>(),
              ),
            ),
          ],
          child: GestureDetector(
            onTap: hideKeyboard,
            child: const HomeScreen(),
          ),
        ),
      ),
    );
  }
}
