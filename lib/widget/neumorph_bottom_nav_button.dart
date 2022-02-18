import 'package:flutter/material.dart';
import 'package:mcq_app/theme/colors.dart';
// ignore: unused_import
import 'package:mcq_app/constants/constants.dart';
import 'package:mcq_app/theme/shadow.dart';
import 'package:mcq_app/widget/color_choose_row.dart';

import '../screens/mcq_page_user.dart';

class BottomNavButton extends StatelessWidget {
  final Color mcqColor;
  final int totalQuestions;
  final int totalOptions;
  final String title;
  final OptionFormat optionFormat;
  final List answer;


  BottomNavButton(
      {Key? key,
      required this.optionFormat,
      required this.mcqColor,
      required this.totalOptions,
      required this.title,
      required this.answer,
      required this.totalQuestions})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => McqPageUser(
                answer: answer,
                optionFormat: optionFormat,
                mcqColor: mcqColor,
                title: title,
                totalOptions: totalOptions,
                totalQuestions: totalQuestions,
              ),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: 60,
            width: double.infinity - 70,
            child: Center(child: Text('CREATE')),
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
