import 'package:flutter/material.dart';
import 'package:mcq_app/constants/constants.dart';
import 'package:mcq_app/theme/colors.dart';
import 'package:mcq_app/theme/shadow.dart';

class ScoreBoard extends StatelessWidget {
  final int totalNumberOfQuestions;
  final int correctAnswers;
  final int wrongAnswers;
  final int skippedAnswers;
  const ScoreBoard(
      {Key? key,
      required this.totalNumberOfQuestions,
      required this.correctAnswers,
      required this.wrongAnswers,
      required this.skippedAnswers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(pBigPadding),
      child: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          color: cBgColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: neumorphShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$correctAnswers / $totalNumberOfQuestions',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: _getColor(
                    correct: correctAnswers, total: totalNumberOfQuestions),
              ),
            ),
            Text(
              'Correct $correctAnswers',
              style: TextStyle(
                fontSize: 18,
                color: cGreen,
              ),
            ),
            Text(
              'Wrong $wrongAnswers',
              style: TextStyle(
                fontSize: 18,
                color: cRed,
              ),
            ),
            Text(
              'Skipped $skippedAnswers',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_getColor({required int correct, required int total}) {
  double grade = (correct / total) * 100;
  if (grade >= 80.0) {
    return cGreen;
  }
  if (grade >= 70.0) {
    return cLightGreen;
  }
  if (grade >= 50.0) {
    return cYellow;
  }
  return cRed;
}
