import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/routes/routes.dart';
import 'package:survey_app/services/question_service.dart';
import 'package:survey_app/utils/utils.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  // ignore: prefer_final_fields
  PageController? _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.tertiaryColor,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Consumer<QuestionService>(
          builder: (context, value, child) {
            return PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _controller!,
                itemCount: value.currentQuestionnaire.questions.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Question ${index + 1} /${value.currentQuestionnaire.questions.length}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 20),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 8.0,
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        value.currentQuestionnaire.questions[index].question,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      for (int i = 0;
                          i <
                              value.currentQuestionnaire.questions[index]
                                  .answers.length;
                          i++)
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 18),
                          child: MaterialButton(
                            shape: const StadiumBorder(),
                            color: value.currentQuestionnaire.questions[index]
                                        .selectedAnswer ==
                                    i
                                ? Colors.yellow
                                : Utils.bottonColor,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            onPressed: () {
                              context
                                  .read<QuestionService>()
                                  .setAnswer(index, i);
                            },
                            child: Text(
                              value.currentQuestionnaire.questions[index]
                                  .answers[i]
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: const StadiumBorder(),
                              side: const BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            onPressed: () {
                              _controller!.previousPage(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: const Text(
                              'Previous Question',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: const StadiumBorder(),
                              side: const BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            onPressed: index + 1 ==
                                    value.currentQuestionnaire.questions.length
                                ? () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushNamed(RouteManager
                                                            .resultPage);
                                                    context
                                                        .read<QuestionService>()
                                                        .currentQuestionnaire;
                                                  },
                                                  child: const Text(
                                                    'YES',
                                                    style: TextStyle(
                                                        color: Utils.mainColor,
                                                        fontSize: 20),
                                                  )),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'NO',
                                                  style: TextStyle(
                                                      color: Utils.mainColor,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ],
                                            content: const Text(
                                                'Are you sure you want to submit this survey?'),
                                          );
                                        });
                                  }
                                : () {
                                    _controller!.nextPage(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                            child: Text(
                              index + 1 ==
                                      value
                                          .currentQuestionnaire.questions.length
                                  ? 'Submit'
                                  : 'Next Question',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
