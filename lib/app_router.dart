import 'package:flutter/material.dart';
import 'package:pokedex/screens/home.dart';
import 'package:pokedex/screens/login.dart';

class AppRouter {
  bool isAuthenticated = false; // Initial authentication state

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) {
          if (isAuthenticated) {
            return const PokedexHome();
          } else {
            return LoginForm();
          }
        });

      // Define other routes as needed

      default:
        return MaterialPageRoute(builder: (_) => const Text("Error"));
    }
  }

  // Function to set authentication state
  void _setAuthState(bool isAuthenticated) {
    this.isAuthenticated = isAuthenticated;
  }
}
