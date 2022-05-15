// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[90],
        appBar: AppBar(
          title: Text('Exam'),
          backgroundColor: Colors.blueGrey[500],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];
  int writeAnswers = 0;

  AppBrain appBrain = AppBrain();

  void checkAnswer(bool whatUserPicked) {
    //appBrain.questionGroup[qNumber].questionAnswer = false;
    bool correctAnswer = appBrain.getQuestionAnswer();
    setState(
      () {
        if (whatUserPicked == correctAnswer) {
          answerResult.add(
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.thumb_up,
                color: Colors.green,
              ),
            ),
          );
          writeAnswers++;
        } else {
          answerResult.add(
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.thumb_down,
                color: Colors.red,
              ),
            ),
          );
        }
        if (appBrain.isFinished() == true) {
          Alert(
            context: context,
            title: "انتهاء الإختبار",
            desc: "لقد أجبت على $writeAnswers أسئلة بشكل صحيح من أصل 7.",
            buttons: [
              DialogButton(
                child: Text(
                  "ابدأ من جديد",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              ),
            ],
          ).show();

          writeAnswers = 0;

          appBrain.reset();

          answerResult = [];
        } else {
          appBrain.nexQuestion();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Image.asset(
                appBrain.getQuestionImage(),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                appBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(true);
              },
              color: Colors.green,
              child: Text(
                'صح',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(false);
              },
              color: Colors.redAccent,
              child: Text(
                'خطأ',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
