import 'package:books_app/core/service_locator/service_locator.dart';
import 'package:books_app/features/root_widget_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(
    const RootWidgetPage(),
  );
}
