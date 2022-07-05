import 'package:flutter/cupertino.dart';
import 'package:survey_app/models/questionnaire.dart';

class QuestionService with ChangeNotifier {
  Questionnaire currentQuestionnaire = Questionnaire();
  // final List<Questionnaire> questionnaires = [];

  void setAnswer(int questionIndex, int answerIndex) {
    currentQuestionnaire.questions[questionIndex].selectedAnswer = answerIndex;
    notifyListeners();
  }

  void setQuestions() {
    currentQuestionnaire = Questionnaire();
    notifyListeners();
  }
}
