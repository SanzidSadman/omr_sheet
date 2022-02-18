import 'package:flutter/material.dart';
import 'package:mcq_app/theme/colors.dart';
import 'package:mcq_app/widget/color_choose_row.dart';
import 'package:mcq_app/widget/score_board.dart';

import '../widget/result_mcq_row.dart';

class ResultPage extends StatefulWidget {
  final Color mcqColor;
  final int totalQuestions;
  final int totalOptions;
  final String title;
  OptionFormat optionFormat;
  List userAnswer;
  List answer;

  int correctAnswers;
  int wrongAnswers;
  int skippedAnswers;

  ResultPage(
      {Key? key,
      required this.correctAnswers,
      required this.wrongAnswers,
      required this.skippedAnswers,
      required this.userAnswer,
      required this.answer,
      required this.optionFormat,
      required this.mcqColor,
      required this.totalOptions,
      required this.title,
      required this.totalQuestions})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: cBgColor,
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: cBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScoreBoard(
                      totalNumberOfQuestions: widget.totalQuestions,
                      correctAnswers: widget.correctAnswers,
                      wrongAnswers: widget.wrongAnswers,
                      skippedAnswers: widget.skippedAnswers),
                  for (int i = 0; i < widget.totalQuestions; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ResultMcqRow(
                          optionFormat: widget.optionFormat,
                          mcqColor: widget.mcqColor,
                          userAnswer: widget.userAnswer,
                          answer: widget.answer,
                          questionNumber: i + 1,
                          totalOptions: widget.totalOptions,
                          totalQuestions: widget.totalQuestions,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
