import 'package:flutter/material.dart';
import 'package:survey_app/pages/login.dart';
import 'package:survey_app/pages/question_page.dart';

import '../pages/starting_page.dart';

class RouteManager {
  static const String loginPage = '/';
  static const String startingPage = '/startingPage';
  static const String questionPage = '/questionPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case startingPage:
        return MaterialPageRoute(
          builder: (context) => const StartingPage(),
        );
      case questionPage:
        return MaterialPageRoute(
          builder: ((context) => const QuestionPage()),
        );
      default:
        throw const FormatException('Route not found!, check routes again');
    }
  }
}
