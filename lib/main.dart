import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_themes.dart';
import 'package:test_repo_example/common/utils/app_responsive.dart';
import 'package:test_repo_example/common/utils/context_utils.dart';
import 'package:test_repo_example/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        home: GestureDetector(
          onTap: hideKeyboard,
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
