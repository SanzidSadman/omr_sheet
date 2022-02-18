
import 'package:flutter/material.dart';
import 'package:mcq_app/constants/constants.dart';
import 'package:mcq_app/theme/colors.dart';
import 'package:mcq_app/theme/shadow.dart';
import 'package:mcq_app/widget/color_choose_row.dart';

class McqCircle extends StatefulWidget {
  final int value;
  int groupValue;
  final Function callbackFunction;
  Color mcqColor;
  OptionFormat optionFormat;
  McqCircle(
      {Key? key,
      required this.optionFormat,
      required this.mcqColor,
      required this.groupValue,
      required this.callbackFunction,
      required this.value})
      : super(key: key);

  @override
  State<McqCircle> createState() => _McqCircleState();
}

class _McqCircleState extends State<McqCircle> {
  final _circleAnimationDuration = Duration(milliseconds: 150);
  final double _transformScale = 1.2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(pSmallPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.callbackFunction(widget.value);
          });
        },
        child: Transform.scale(
          scale: (widget.groupValue == widget.value) ? _transformScale : 1,
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
              AnimatedContainer(
                duration: _circleAnimationDuration,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: widget.mcqColor, width: 2),
                  shape: BoxShape.circle,
                  color: (widget.groupValue == widget.value)
                      ? widget.mcqColor
                      : cBgColor,
                  boxShadow: (widget.groupValue == widget.value)
                      ? neumorphShadowMcq
                      : null,
                ),
                child: Center(
                    child: Text(
                  getText(idx: widget.value, optionFormat: widget.optionFormat),
                  style: TextStyle(
                      fontSize: (widget.groupValue == widget.value) ? 22 : 18,
                      fontWeight: (widget.groupValue == widget.value)
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: (widget.groupValue == widget.value)
                          ? Colors.white
                          : Colors.black),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getText({required int idx, required OptionFormat optionFormat}) {
    print('THIS IS ME $optionFormat');
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
}
