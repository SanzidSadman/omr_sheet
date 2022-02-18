import 'package:flutter/material.dart';
import 'package:mcq_app/theme/colors.dart';
import 'package:mcq_app/screens/create_page.dart';
import 'package:mcq_app/theme/shadow.dart';

class NeumorphLargeIconButton extends StatefulWidget {
  final IconData neumorphIcon;
  const NeumorphLargeIconButton({Key? key, required this.neumorphIcon})
      : super(key: key);

  @override
  State<NeumorphLargeIconButton> createState() => _NeumorphLargeIconButtonState();
}

class _NeumorphLargeIconButtonState extends State<NeumorphLargeIconButton> {
  bool _isElevated = true;
  final _animationDuration = 200;

  void pageNavigation({required BuildContext context}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CreatePage()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setState(() => _isElevated = false),
      onTapUp: (details) => setState(() => _isElevated = true),
      onTap: () {
        pageNavigation(context: context);
      },
      onTapCancel: () {
        setState(() {
          _isElevated = !_isElevated;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: _animationDuration),
        height: 100,
        width: 100,
        child: Icon(
          widget.neumorphIcon,
          size: 80,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: cBgColor,
            boxShadow: _isElevated ? neumorphShadow : null),
      ),
    );
  }
}
