import 'package:flutter/material.dart';
import 'package:mcq_app/constants/constants.dart';
import 'package:mcq_app/theme/colors.dart';
// ignore: unused_import
import 'package:mcq_app/screens/create_page.dart';
import 'package:mcq_app/theme/shadow.dart';

class NeumorphElevatedIconButton extends StatefulWidget {
  final String text;
  final Function onPressed;

  const NeumorphElevatedIconButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  State<NeumorphElevatedIconButton> createState() =>
      _NeumorphElevatedIconButtonState();
}

class _NeumorphElevatedIconButtonState
    extends State<NeumorphElevatedIconButton> {
  bool _isElevated = true;
  final _animationDuration = 200;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) =>setState(() {
         _isElevated = false;
      }),
      onTapUp: (details) =>setState(() {
         _isElevated = true;
      }),
      onTap: () {
        widget.onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.all(pMediumPadding),
        child: AnimatedContainer(
          duration: Duration(milliseconds: _animationDuration),
          height: 50,
          width: 90,
          child: Center(child: Text(widget.text)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: cBgColor,
              boxShadow: (_isElevated) ? neumorphShadow : null),
        ),
      ),
    );
  }
}
