import 'package:flutter/material.dart';
import 'package:durakla_app/core/routes.dart';
import 'package:durakla_app/core/theme.dart';
import 'package:durakla_app/screens/splash_screen.dart';
import 'package:durakla_app/screens/onboarding_screen.dart';
import 'package:durakla_app/screens/home_page.dart';
import 'package:durakla_app/screens/bus_selection_screen.dart';
import 'package:durakla_app/screens/stop_selection_screen.dart';
import 'package:durakla_app/screens/tracking_screen.dart';
import 'package:durakla_app/screens/settings_screen.dart';

void main() {
  runApp(const DuraklaApp());
}

class DuraklaApp extends StatelessWidget {
  const DuraklaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Durakla',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.lineSelection: (context) => const HomePage(),
        AppRoutes.busSelection: (context) => const BusSelectionScreen(),
        AppRoutes.stopSelection: (context) => const StopSelectionScreen(),
        AppRoutes.tracking: (context) => const TrackingScreen(),
        AppRoutes.settings: (context) => const SettingsScreen(),
      },
    );
  }
}
