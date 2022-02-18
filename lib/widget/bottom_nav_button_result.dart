import 'package:flutter/material.dart';
import 'package:mcq_app/screens/result.dart';
import 'package:mcq_app/theme/colors.dart';
import 'package:mcq_app/constants/constants.dart';
import 'package:mcq_app/theme/shadow.dart';
import 'package:mcq_app/widget/color_choose_row.dart';


class BottomNavButtonResult extends StatefulWidget {
  List realAnswer;
  List userAnswer;
  int totalQuestion;
  int totalOption;
  Color color;
  OptionFormat optionFormat;
  String title;
  BottomNavButtonResult({
    Key? key,
    required this.totalOption,
    required this.totalQuestion,
    required this.color,
    required this.title,
    required this.optionFormat,
    required this.userAnswer,
    required this.realAnswer,
  }) : super(key: key);

  @override
  State<BottomNavButtonResult> createState() => _BottomNavButtonResultState();
}

class _BottomNavButtonResultState extends State<BottomNavButtonResult> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          int correctAnswer = 0, wrongAnswer = 0, skippedAnswer = 0;
          for (int i = 1; i < widget.realAnswer.length; i++) {
            if (widget.realAnswer[i] == widget.userAnswer[i])
              correctAnswer++;
            else if (widget.userAnswer[i] == 0)
              skippedAnswer++;
            else
              wrongAnswer++;
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                correctAnswers: correctAnswer,
                wrongAnswers: wrongAnswer,
                skippedAnswers: skippedAnswer,
                answer: widget.realAnswer,
                title: widget.title,
                userAnswer: widget.userAnswer,
                totalQuestions: widget.totalQuestion,
                totalOptions: widget.totalOption,
                mcqColor: widget.color,
                optionFormat: widget.optionFormat,
              ),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: 60,
            width: double.infinity - 70,
            child: Center(child: Text(sSubmit)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cBgColor,
              boxShadow: neumorphShadow,
            ),
          ),
        ),
      ),
    );
  }
}
