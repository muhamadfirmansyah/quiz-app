import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// connection using <MyApp>
// create createState method
// add _ becomes private class
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'orange', 'score': 10},
        {'text': 'blue', 'score': 6},
        {'text': 'green', 'score': 3},
        {'text': 'purple', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'tiger', 'score': 10},
        {'text': 'elephant', 'score': 4},
        {'text': 'horse', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite teacher?',
      'answers': [
        {'text': 'Matt', 'score': 10},
        {'text': 'Matt', 'score': 6},
        {'text': 'Matt', 'score': 3},
        {'text': 'Matt', 'score': 1},
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int? score) {

    _totalScore += score!;

    // setState provided by State class
    setState(() {
      _questionIndex = _questionIndex + 1;
      if (_questionIndex < _questions.length) {
        print("You have more question!");
      }
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange)))),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz Game"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
