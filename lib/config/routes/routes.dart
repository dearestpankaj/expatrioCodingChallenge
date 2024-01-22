
import 'package:coding_challenge/feature/login/presentation/page/login_page.dart';
import 'package:flutter/material.dart';

import '../../feature/home/presentation/page/home_page.dart';

class AppRoutes {
  static Route onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(LoginPage());

      case '/home':
        return _materialRoute(HomePage());

      default:
        return _materialRoute(LoginPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}