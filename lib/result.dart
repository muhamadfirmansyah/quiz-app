import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPrase {
    var resultText = "You did it!";

    if (resultScore <= 8) {
      resultText = "You are awesome and innocent!";
    } else if (resultScore <= 12) {
      resultText = "Pretty likeable";
    } else if (resultScore <= 16) {
      resultText = "You are ... strange";
    } else {
      resultText = "You are bad!";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPrase,
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            onPressed: resetQuiz,
            child: Text(
              "Reset",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            style: OutlinedButton.styleFrom(
              primary: Colors.orange,
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
