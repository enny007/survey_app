import 'package:flutter/material.dart';
import 'package:survey_app/pages/login.dart';
import 'package:survey_app/pages/question_page.dart';
import 'package:survey_app/pages/result_page.dart';
import 'package:survey_app/pages/splashpage.dart';

import '../pages/starting_page.dart';

class RouteManager {
  static const String splashPage = '/';
  static const String loginPage = '/loginPage';
  static const String startingPage = '/startingPage';
  static const String questionPage = '/questionPage';
  static const String resultPage = '/resultPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(
          builder: ((context) => const SplashPage()),
        );
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
      case resultPage:
        return MaterialPageRoute(
          builder: (context) => const ResultPage(),
        );
      default:
        throw const FormatException('Route not found!, check routes again');
    }
  }
}
