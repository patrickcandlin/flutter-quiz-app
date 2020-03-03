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
      'answers': ['Great!', 'Good.', 'Okay...', 'Meh.', 'Bad!'],
    },
    {
      'question': "What is your Favorite animal?",
      'answers': ['snail', 'cat', 'dog', 'bear', 'hummingbird']
    }
  ];
  int _questionsIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionsIndex++;
      print('This worked!');
    });
  }

  void _resetQuiz() {
    print('pressed');
    setState(() {
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
            : Result(_resetQuiz),
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
