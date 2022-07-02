class QuestionModel {
  String question;
  List<String> answers;
  int? selectedAnswer;

  String? getAnswer() {
    return selectedAnswer != null ? answers[selectedAnswer!] : null;
  }

  QuestionModel(
    this.question,
    this.answers,
  );
}
