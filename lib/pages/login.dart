import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/routes/routes.dart';
import 'package:survey_app/services/name_input_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  // @override
  // void didChangeDependencies() {
  //   _controller.addListener(() {
  //     context.read<NameInputService>().text = _controller.text;
  //   });
  //   super.didChangeDependencies();
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login here',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 140),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: const Color(0xff0444C0).withOpacity(0.2),
                      width: 3,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xff00828A).withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Please enter your name',
                            focusColor: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (() {
                Navigator.of(context).pushNamed(RouteManager.startingPage);
                context.read<NameInputService>().text = _controller.text;
              }),
              child: Container(
                height: 50,
                width: 150,
                decoration: const BoxDecoration(
                  color: Color(0xff00828A),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.login,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
