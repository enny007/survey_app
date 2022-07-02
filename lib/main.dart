import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/routes/routes.dart';
import 'package:survey_app/services/name_input_service.dart';

import 'package:survey_app/services/question_service.dart';

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
        statusBarColor: Color(0xff00828A),
        statusBarBrightness: Brightness.light));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => QuestionService()),
        ),
        ChangeNotifierProvider(
          create: (context) => NameInputService(),
        )
      ],
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: const ColorScheme.light(
              secondary: Color(0xff0444C0),
            ),
            backgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteManager.splashPage,
          onGenerateRoute: RouteManager.generateRoute,
        );
      },
    );
  }
}
