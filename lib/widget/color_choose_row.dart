import 'package:flutter/material.dart';
import 'package:mcq_app/constants/constants.dart';
import 'package:mcq_app/theme/colors.dart';
import 'package:mcq_app/theme/shadow.dart';

class ColorChooseRow extends StatefulWidget {
  Function changeColor;
  Function changeOptionFormat;
  ColorChooseRow(
      {Key? key, required this.changeColor, required this.changeOptionFormat})
      : super(key: key);

  @override
  State<ColorChooseRow> createState() => _ColorChooseRowState();
}

class _ColorChooseRowState extends State<ColorChooseRow> {
  final _animationDuration = Duration(milliseconds: 200);

  bool _isSelectedColor = false;
  bool _isSelectedOptionFormat = false;

  int _groupValueColor = 1;
  int _groupValueOptionFormat = 1;

  Color _color = Colors.black;
  OptionFormat _optionFormat = OptionFormat.abc;

  changeIsSelectedColor({
    required int colorIdx,
  }) {
    setState(() {
      _isSelectedColor = !_isSelectedColor;
      _groupValueColor = colorIdx;
    });
    widget.changeColor(colorIdx);
  }

  changeIsSelectedOptionFormat({
    required int formatIdx,
    required OptionFormat optionFormat,
  }) {
    setState(() {
      _isSelectedOptionFormat = !_isSelectedOptionFormat;
      _groupValueOptionFormat = formatIdx;
      _optionFormat = optionFormat;
    });
    widget.changeOptionFormat(formatIdx, optionFormat);
  }

  singleColorCircle(int i) {
    switch (i) {
      case 1:
        _color = Colors.black;
        break;
      case 2:
        _color = cPurple;
        break;
      default:
        _color = cBlue;
        break;
    }

    return Padding(
      padding: EdgeInsets.all(pSmallPadding),
      child: GestureDetector(
        onTap: () {
          changeIsSelectedColor(
            colorIdx: i,
          );
        },
        child: Transform.scale(
          scale: (_groupValueColor == i) ? 1.2 : 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: _animationDuration,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cBgColor,
                  boxShadow: (_groupValueColor == i) ? neumorphShadowMcq : null,
                ),
                child: Center(
                    child: Container(
                  decoration:
                      BoxDecoration(color: _color, shape: BoxShape.circle),
                  height: 20,
                  width: 20,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  optionFormat(int i) {
    String _text;
    switch (i) {
      case 1:
        _optionFormat = OptionFormat.abc;
        _text = 'abc';
        break;
      case 2:
        _optionFormat = OptionFormat.iii;
        _text = 'iii';
        break;
      default:
        _optionFormat = OptionFormat.a123;
        _text = '123';
        break;
    }

    return Padding(
      padding: EdgeInsets.all(pSmallPadding),
      child: GestureDetector(
        onTap: () {
          changeIsSelectedOptionFormat(
              formatIdx: i, optionFormat: _optionFormat);
        },
        child: Transform.scale(
          scale: (_groupValueOptionFormat == i) ? 1.2 : 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: _animationDuration,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cBgColor,
                  boxShadow:
                      (_groupValueOptionFormat == i) ? neumorphShadowMcq : null,
                ),
                child: Center(
                  child: Container(
                    child: Center(
                      child: Text(_text),
                    ),
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(pSmallPadding),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(pSmallPadding),
            child: Text('Choose a color'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 1; i <= 3; i++) singleColorCircle(i),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(pSmallPadding),
            child: Text('Choose an option format'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 1; i <= 3; i++) optionFormat(i),
            ],
          ),
        ],
      ),
    );
  }
}

enum OptionFormat { abc, a123, iii }
