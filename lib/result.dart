import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetQuiz;

  Result(this.resetQuiz);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(15),
          child: Text(
            'This is the result of the quiz...',
            style: TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: double.infinity,
          child: RaisedButton(
            child: Text('Retake Quiz'),
            color: Colors.cyanAccent,
            onPressed: resetQuiz,
          ),
        ),
      ],
    );
  }
}
