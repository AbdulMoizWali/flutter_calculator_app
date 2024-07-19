import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/routes/route_path.dart';
import 'package:flutter_calculator_app/theme/theme_builder.dart';
import 'package:flutter_calculator_app/routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeBuilder.buildTheme(context, Brightness.dark),
      initialRoute: RoutePath.calculator,
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
    );
  }
}
