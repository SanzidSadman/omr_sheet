// ignore: unused_import
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mcq_app/constants/constants.dart';
import 'package:mcq_app/theme/colors.dart';
import 'package:mcq_app/theme/shadow.dart';
import 'package:mcq_app/widget/color_choose_row.dart';

class ResultMcqCircle extends StatefulWidget {
  final int value;

  Color mcqColor;
  int mcqIdx;
  int row;
  OptionFormat optionFormat;
  List realAnswer;
  List userAnswer;
  ResultMcqCircle(
      {Key? key,
      required this.realAnswer,
      required this.userAnswer,
      required this.optionFormat,
      required this.mcqColor,
      required this.row,
      required this.mcqIdx,
      required this.value})
      : super(key: key);

  @override
  State<ResultMcqCircle> createState() => _ResultMcqCircleState();
}

class _ResultMcqCircleState extends State<ResultMcqCircle> {
  @override
  Widget build(BuildContext context) {
    DecorationHelper _decorationHelper = getDecorationInstance(
        i: widget.row,
        j: widget.mcqIdx,
        userAnswer: widget.userAnswer,
        realAnswer: widget.realAnswer);

    return Padding(
      padding: const EdgeInsets.all(pSmallPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _decorationHelper.bgColor,
                boxShadow: _decorationHelper.boxShadow,
                border:
                    Border.all(color: _decorationHelper.borderColor, width: 2)),
            child: Center(
              child: Text(
                getText(idx: widget.value, optionFormat: widget.optionFormat),
                style: TextStyle(
                  fontSize: _decorationHelper.fontSize,
                  fontWeight: _decorationHelper.fontWeight,
                  color: _decorationHelper.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText({required int idx, required OptionFormat optionFormat}) {
  
    if (optionFormat == OptionFormat.abc) {
      if (idx == 1) return 'A';
      if (idx == 2) return 'B';
      if (idx == 3)
        return 'C';
      else
        return 'D';
    }
    if (optionFormat == OptionFormat.iii) {
      if (idx == 1) return 'i';
      if (idx == 2) return 'ii';
      if (idx == 3)
        return 'iii';
      else
        return 'iv';
    } else {
      if (idx == 1) return '1';
      if (idx == 2) return '2';
      if (idx == 3)
        return '3';
      else
        return '4';
    }
  }

  getDecorationInstance({
    required int i,
    required int j,
    required userAnswer,
    required realAnswer,
  }) {
    DecorationHelper decorationHelper = DecorationHelper(
      bgColor: cBgColor,
      borderColor: widget.mcqColor,
      fontSize: 18,
      boxShadow: [],
      textColor: Colors.black,
    );

    if (userAnswer[i] == realAnswer[i]) {
      if (userAnswer[i] == j) {
        decorationHelper
          ..bgColor = cGreen
          ..borderColor = cGreen
          ..boxShadow = neumorphShadowMcq
          ..textColor = Colors.white
          ..fontSize = 22
          ..fontWeight = FontWeight.bold;
      }
    } else if (userAnswer[i] == 0) {
      if (realAnswer[i] == j) {
        decorationHelper
          ..bgColor = Colors.grey
          ..borderColor = cRed
          ..boxShadow = neumorphShadowMcq
          ..textColor = Colors.white
          ..fontSize = 22
          ..fontWeight = FontWeight.bold;
      }
    } else if (userAnswer[i] != realAnswer[i]) {
      if (userAnswer[i] == j) {
        decorationHelper
          ..bgColor = Colors.red
          ..borderColor = cRed
          ..boxShadow = neumorphShadowMcq
          ..textColor = Colors.white
          ..fontSize = 22
          ..fontWeight = FontWeight.bold;
      } else if (realAnswer[i] == j) {
        decorationHelper
          ..bgColor = widget.mcqColor
          ..borderColor = widget.mcqColor
          ..boxShadow = neumorphShadowMcq
          ..textColor = Colors.white
          ..fontSize = 22
          ..fontWeight = FontWeight.bold;
      }
    }
    return decorationHelper;
  }
}

class DecorationHelper {
  Color borderColor;
  Color bgColor;
  List<BoxShadow>? boxShadow;
  double fontSize;
  FontWeight fontWeight;
  Color textColor;
  DecorationHelper({
    this.bgColor = cBgColor,
    this.borderColor = Colors.black,
    this.boxShadow,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.textColor = Colors.black,
  });
}
