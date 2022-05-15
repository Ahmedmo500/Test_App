class Question {
  String questionText = '';
  String questionImage = '';
  bool questionAnswer = true;

  Question({required String q, required String i, required bool a}) {
    questionText = q;
    questionImage = i;
    questionAnswer = a;
  }
}
