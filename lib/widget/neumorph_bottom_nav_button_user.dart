import 'package:flutter/material.dart';
import 'package:mcq_app/theme/colors.dart';
import 'package:mcq_app/constants/constants.dart';
import 'package:mcq_app/theme/shadow.dart';


class BottomNavButtonUser extends StatefulWidget {
  final List answer;
  final List userAnswer;

  BottomNavButtonUser({
    Key? key,
    required this.userAnswer,
    required this.answer,
  }) : super(key: key);

  @override
  State<BottomNavButtonUser> createState() => _BottomNavButtonUserState();
}

class _BottomNavButtonUserState extends State<BottomNavButtonUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        
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
