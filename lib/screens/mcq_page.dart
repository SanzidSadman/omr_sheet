import 'package:flutter/material.dart';
import 'package:mcq_app/theme/colors.dart';

import 'package:mcq_app/widget/color_choose_row.dart';

import 'package:mcq_app/widget/mcq_row.dart';

import '../widget/neumorph_bottom_nav_button.dart';

class McqPage extends StatefulWidget {
  final Color mcqColor;
  final int totalQuestions;
  final int totalOptions;
  final String title;
  OptionFormat optionFormat;
  McqPage(
      {Key? key,
      required this.optionFormat,
      required this.mcqColor,
      required this.totalOptions,
      required this.title,
      required this.totalQuestions})
      : super(key: key);

  @override
  State<McqPage> createState() => _McqPageState();
}

class _McqPageState extends State<McqPage> {
  // late var userAnswerList = List.filled(widget.totalQuestions + 1, 0);
  late var answerList = List.filled(widget.totalQuestions + 1, 0);

  updateList(int index, int choice) {
    setState(() {
      answerList[index] = choice;
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
      bottomNavigationBar: BottomNavButton(
        mcqColor: widget.mcqColor,
        totalQuestions: widget.totalQuestions,
        totalOptions: widget.totalOptions,
        title: widget.title,
        answer: answerList,
        optionFormat: widget.optionFormat,
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
