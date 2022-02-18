import 'package:flutter/material.dart';
import 'package:mcq_app/widget/color_choose_row.dart';
import 'package:mcq_app/widget/mcq_circle.dart';

class McqRow extends StatefulWidget {
  final Color mcqColor;
  final int questionNumber;
  final int totalQuestions;
  final int totalOptions;
  final Function updateListCallback;
  final OptionFormat optionFormat;

  McqRow(
      {Key? key,
      required this.optionFormat,
      required this.mcqColor,
      required this.questionNumber,
      required this.totalQuestions,
      required this.totalOptions,
      required this.updateListCallback})
      : super(key: key);

  @override
  _McqRowState createState() => _McqRowState();
}

class _McqRowState extends State<McqRow> {
  int groupValue = 0;

  callback(int value) {
    widget.updateListCallback(widget.questionNumber, value);
    setState(() {
      groupValue = value;
    });
  }

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
          McqCircle(
            optionFormat: widget.optionFormat,
            mcqColor: widget.mcqColor,
            callbackFunction: callback,
            value: j + 1,
            groupValue: groupValue,
          ),
      ],
    );
  }
}
