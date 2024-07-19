    import 'package:flutter/material.dart';
    import 'package:flutter_calculator_app/routes/route_path.dart';
    import 'package:flutter_calculator_app/screens/calculator_screen.dart';

    class RoutesGenerator {
      static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
        switch (settings.name) {

                      case RoutePath.calculator:
              return MaterialPageRoute(builder: (_) => const CalculatorScreen());
            

          default:
            return MaterialPageRoute(builder: (_) => const NotFoundScreen());
        }
      }
    }

    class NotFoundScreen extends StatelessWidget {
      const NotFoundScreen({super.key});

      @override
      Widget build(BuildContext context) {
        return const Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        );
      }
    }
    