import 'package:flutter/material.dart';
import 'package:survey_app/routes/routes.dart';
import 'package:survey_app/utils/utils.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushNamed(RouteManager.loginPage);
    });
    return Scaffold(
      backgroundColor: Utils.mainColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 5),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/cervical-2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Together, we can fight cervical cancer!....',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white.withOpacity(0.4)),
            ),
          )
        ],
      ),
    );
  }
}
