import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'features/home/home_screen.dart';

/// Global theme notifier — toggled by the nav bar moon icon
final themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.system);

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'Muhammad Farhan — Flutter Developer',
          debugShowCheckedModeBanner: false,
          theme: getLightTheme(),
          darkTheme: getDarkTheme(),
          themeMode: mode,
          home: const HomeScreen(),
          // Smooth scroll behavior for web
          scrollBehavior: const _WebScrollBehavior(),
        );
      },
    );
  }
}

/// Enable mouse drag scrolling on web
class _WebScrollBehavior extends MaterialScrollBehavior {
  const _WebScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
