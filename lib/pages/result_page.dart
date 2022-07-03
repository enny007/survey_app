import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/routes/routes.dart';
import 'package:survey_app/services/name_input_service.dart';
import 'package:survey_app/services/question_service.dart';
import 'package:survey_app/utils/utils.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Utils.tertiaryColor,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Consumer<NameInputService>(
                      builder: (context, value, child) {
                        return Text(
                          'Your Survey Result, ${value.text}:',
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Consumer<QuestionService>(
                    builder: (context, value, child) {
                      return ListView.separated(
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.currentQuestionnaire.questions[index]
                                        .question,
                                    style: const TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    value.currentQuestionnaire.questions[index]
                                            .getAnswer() ??
                                        "",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          separatorBuilder: (_, child) => const SizedBox(
                                height: 10,
                              ),
                          itemCount:
                              value.currentQuestionnaire.questions.length);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, bottom: 15),
                  child: FloatingActionButton(
                    backgroundColor: Utils.mainColor,
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.startingPage);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
