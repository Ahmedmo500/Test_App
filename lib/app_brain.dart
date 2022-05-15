// ignore_for_file: unused_field, prefer_final_fields

import 'question.dart';

class AppBrain {
  int _qNumber = 0;

  List<Question> _questionGroup = [
    Question(
      q: 'يوجد 8 كواكب في المجموعة الشمسية',
      i: 'images/image-1.jpg',
      a: true,
    ),
    Question(
      q: 'القطط حيوانات أكلة للحوم',
      i: 'images/image-2.jpg',
      a: true,
    ),
    Question(
      q: 'الصين موجودة في قارة افريقيا',
      i: 'images/image-3.jpg',
      a: false,
    ),
    Question(
      q: 'الأرض مسطحة وليست كروية',
      i: 'images/image-4.jpg',
      a: false,
    ),
    Question(
      q: 'بإستطاعة الإنسان البقاء على قيد الحياة بدون أكل اللحوم',
      i: 'images/image-5.jpg',
      a: true,
    ),
    Question(
      q: 'الشمس تدور حول الأرض والأرض تدور حول القمر',
      i: 'images/image-6.jpg',
      a: false,
    ),
    Question(
      q: 'الحيوانات لاتشعر بالألم',
      i: 'images/image-7.jpg',
      a: false,
    ),
  ];

  void nexQuestion() {
    if (_qNumber < _questionGroup.length - 1) {
      _qNumber++;
    }
  }

  String getQuestionText() {
    return _questionGroup[_qNumber].questionText;
  }

  String getQuestionImage() {
    return _questionGroup[_qNumber].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionGroup[_qNumber].questionAnswer;
  }

  bool isFinished() {
    if (_qNumber >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _qNumber = 0;
  }
}
