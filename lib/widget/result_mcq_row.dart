import 'package:flutter/material.dart';
import 'package:mcq_app/widget/color_choose_row.dart';
import 'package:mcq_app/widget/result_mcq_circle.dart';

class ResultMcqRow extends StatefulWidget {
  final Color mcqColor;
  final int questionNumber;
  final int totalQuestions;
  final int totalOptions;

  final userAnswer;
  final answer;

  final OptionFormat optionFormat;

  ResultMcqRow({
    Key? key,
    required this.userAnswer,
    required this.answer,
    required this.optionFormat,
    required this.mcqColor,
    required this.questionNumber,
    required this.totalQuestions,
    required this.totalOptions,
  }) : super(key: key);

  @override
  _ResultMcqRowState createState() => _ResultMcqRowState();
}

class _ResultMcqRowState extends State<ResultMcqRow> {
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70.0, right: 5),
          child: Text(
            widget.questionNumber.toString(),
            style: TextStyle(fontSize: 18),
          ),
        ),
        for (int j = 0; j < widget.totalOptions; j++)
          ResultMcqCircle(
            optionFormat: widget.optionFormat,
            mcqColor: widget.mcqColor,
            row: widget.questionNumber,
            mcqIdx: j + 1,
            value: j + 1,
            userAnswer: widget.userAnswer,
            realAnswer: widget.answer,
          ),
      ],
    );
  }
}
