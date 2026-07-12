import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'data/repositories/portfolio_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set browser tab title and meta for web
  SystemChrome.setApplicationSwitcherDescription(
    const ApplicationSwitcherDescription(
      label: 'Muhammad Farhan — Flutter Developer',
    ),
  );

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint('Flutter Error: ${details.exception}');
  };

  PortfolioRepository().initialize();

  runApp(const PortfolioApp());
}
