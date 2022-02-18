import 'package:flutter/material.dart';
import 'package:mcq_app/constants/constants.dart';
import 'package:mcq_app/theme/colors.dart';
// ignore: unused_import
import 'package:mcq_app/screens/create_page.dart';
import 'package:mcq_app/theme/shadow.dart';

class NeumorphCiruclarIconButton extends StatefulWidget {
  final IconData neumorphIcon;
  final Function increaseOptionCallback;

  const NeumorphCiruclarIconButton(
      {Key? key,
      required this.neumorphIcon,
      required this.increaseOptionCallback})
      : super(key: key);

  @override
  State<NeumorphCiruclarIconButton> createState() =>
      _NeumorphCiruclarIconButtonState();
}

class _NeumorphCiruclarIconButtonState
    extends State<NeumorphCiruclarIconButton> {
  bool _isElevated = true;
  final _animationDuration = 200;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => {
        setState(() {
          _isElevated = false;
        })
      },
      onTapUp: (details) => {
        setState(() {
          _isElevated = true;
        })
      },
      onTap: () {
        widget.increaseOptionCallback();
      },
      child: Padding(
        padding: const EdgeInsets.all(pMediumPadding),
        child: AnimatedContainer(
          duration: Duration(milliseconds: _animationDuration),
          height: 60,
          width: 60,
          child: Icon(
            widget.neumorphIcon,
            size: 50,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: cBgColor,
              boxShadow: (_isElevated) ? neumorphShadow : null),
        ),
      ),
    );
  }
}
