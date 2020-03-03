import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final _questions = [
    {
      'question': "How do you feel today?",
      'answers': [
        {'text': 'Great!', 'score': 10},
        {'text': 'Good.', 'score': 8},
        {'text': 'Okay...', 'score': 6},
        {'text': 'Meh.', 'score': 4},
        {'text': 'Bad!', 'score': 2}
      ],
    },
    {
      'question': "What is your Favorite animal?",
      'answers': [
        {'text': 'snail', 'score': 10},
        {'text': 'cat', 'score': 8},
        {'text': 'dog', 'score': 6},
        {'text': 'bear', 'score': 4},
        {'text': 'hummingbird', 'score': 2}
      ]
    }
  ];
  
  int _questionsIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionsIndex++;
      print('This worked!');
    });
  }

  void _resetQuiz() {
    print('pressed');
    setState(() {
      _totalScore = 0;
      _questionsIndex = 0;
      print(_questionsIndex);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is a simple Quiz app'),
        ),
        body: _questionsIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionsIndex,
              )
            : Result(_resetQuiz, _totalScore),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              title: Text('Timer'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Book'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_strikethrough),
              title: Text('nonsense'),
            ),
          ],
        ),
      ),
    );
  }
}
