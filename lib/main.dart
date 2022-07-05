import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/providers/name_input_service.dart';
import 'package:survey_app/providers/question_service.dart';
import 'package:survey_app/routes/routes.dart';

import 'package:survey_app/utils/utils.dart';

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
        statusBarColor: Utils.mainColor,
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
