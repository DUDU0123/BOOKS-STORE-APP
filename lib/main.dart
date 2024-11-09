import 'package:books_app/core/service_locator/service_locator.dart';
import 'package:books_app/features/root_widget_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  initDependencies();
  runApp(
    const RootWidgetPage(),
  );
}
