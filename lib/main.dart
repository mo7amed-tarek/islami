import 'package:flutter/material.dart';
import 'package:islami/Onboarding%20_Screens/onboarding_screen.dart';
import 'package:islami/style/prefs_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateTextStyle.resolveWith(
            (State) =>
                TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
