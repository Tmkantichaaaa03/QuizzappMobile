class QuizModel {
  String question;
  List<String> answers;

  QuizModel(this.question, this.answers);

  List<String> getShuffluedAnswer() {
    final ShuffluedAnswer = List.of(answers);
    ShuffluedAnswer.shuffle();
    return ShuffluedAnswer;
  }
}
