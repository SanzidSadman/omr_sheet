import 'package:flutter/material.dart';
import 'package:mcq_app/theme/colors.dart';

import 'package:mcq_app/widget/bottom_nav_button_result.dart';
import 'package:mcq_app/widget/color_choose_row.dart';

import 'package:mcq_app/widget/mcq_row.dart';

class McqPageUser extends StatefulWidget {
  final Color mcqColor;
  final int totalQuestions;
  final int totalOptions;
  final String title;
  OptionFormat optionFormat;
  List answer;
  McqPageUser(
      {Key? key,
      required this.answer,
      required this.optionFormat,
      required this.mcqColor,
      required this.totalOptions,
      required this.title,
      required this.totalQuestions})
      : super(key: key);

  @override
  State<McqPageUser> createState() => _McqPageUserState();
}

class _McqPageUserState extends State<McqPageUser> {
  late var userAnswerList = List.filled(widget.totalQuestions + 1, 0);

  updateList(int index, int choice) {
    setState(() {
      userAnswerList[index] = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: cBgColor,
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: cBgColor,
      bottomNavigationBar: BottomNavButtonResult(
        realAnswer: widget.answer,
        userAnswer: userAnswerList,
        totalQuestion: widget.totalQuestions,
        title: widget.title,
        totalOption: widget.totalOptions,
        optionFormat: widget.optionFormat,
        color: widget.mcqColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.totalQuestions; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        McqRow(
                          optionFormat: widget.optionFormat,
                          mcqColor: widget.mcqColor,
                          updateListCallback: updateList,
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
