import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetQuiz;
  final int resultScore;

  Result(this.resetQuiz, this.resultScore);
  String get resultPhrase {
    var resultText = 'You did it! $resultScore';
    if (resultScore <= 8) {
      resultText = 'someting $resultScore';
    } else {
      resultText = 'fish $resultScore';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(15),
          child: Text(
            resultPhrase,
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
