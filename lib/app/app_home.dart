import 'package:flutter/material.dart';
import 'package:pokeflutter/app/routes.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'PressStart2P',
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      title: 'Home',
      initialRoute: AppRoutes().initialRoute,
      routes: AppRoutes().publicRoutes,
    );
  }
}
