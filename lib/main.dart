import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_app/routes/routes.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xff0444C0),
        statusBarBrightness: Brightness.light));
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          secondary: Color(0xff0444C0),
        ),
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManager.loginPage,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
