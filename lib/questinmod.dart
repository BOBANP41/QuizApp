class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  

  list.add(Question(
    "Who is the owner of Flutter?",
    [
      Answer("Nokia", false),
      Answer("Samsung", false),
      Answer("Google", true),
      Answer("Apple", false),
    ],
  ));

  list.add(Question(
    "which year flutter relased",
    [
      Answer("2018", true),
      Answer("2020", false),
      Answer("2022", false),
      Answer("2023", false),
    ],
  ));

  list.add(Question(
    "which language is used in flutter",
    [
      Answer("java", false),
      Answer("c++", false),
      Answer("python", false),
      Answer("Dart", true),
    ],
  ));

  list.add(Question(
    "Flutter is a crossplatform",
    [
      Answer("True", true),
      Answer("False", false),
    ],
  ));

  return list;
}