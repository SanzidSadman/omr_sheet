import 'package:flutter/material.dart';
import 'package:mcq_app/screens/mcq_page.dart';
import 'package:mcq_app/theme/colors.dart';
import 'package:mcq_app/widget/color_choose_row.dart';
import 'package:mcq_app/widget/neumorph_circular_icon_button.dart';
import 'package:mcq_app/widget/neumorph_elevated_button.dart';
import 'package:mcq_app/widget/neumorph_textfield.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _totalQuestionController = TextEditingController();
  final _titleController = TextEditingController();
  Color _mcqColor = Colors.black;
  OptionFormat _optionFormat = OptionFormat.abc;

  int _totalMcqOptions = 2;
  increaseTotalMcqOptions() {
    setState(() {
      if (_totalMcqOptions < 4) _totalMcqOptions++;
    });
  }

  decreaseTotalMcqOptions() {
    setState(() {
      if (_totalMcqOptions > 2) _totalMcqOptions--;
    });
  }

  isNeumeric(String s) {
    if (s.isEmpty) return false;
    final n = num.tryParse(s);
    return n == null ? false : true;
  }

  changeFormat(int i, OptionFormat optionFormat) {
    OptionFormat _format;
    switch (i) {
      case 1:
        _format = OptionFormat.abc;

        break;
      case 2:
        _format = OptionFormat.iii;

        break;
      default:
        _format = OptionFormat.a123;
        break;
    }

    setState(() {
      _optionFormat = _format;
    });
  }

  changeColor(int i) {
    Color _color;
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

    setState(() {
      _mcqColor = _color;
    });
  }

  buttonOnPress() {
    final int _totalQuestions;
    if (isNeumeric(_totalQuestionController.text)) {
      _totalQuestions = int.parse(_totalQuestionController.text);
    } else {
      _totalQuestions = -1;
    }

    if (_totalQuestions != -1 && _totalQuestions > 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => McqPage(
                    optionFormat: _optionFormat,
                    mcqColor: _mcqColor,
                    title: _titleController.text,
                    totalOptions: _totalMcqOptions,
                    totalQuestions: _totalQuestions,
                  )));
    } else {
      SnackBar snackBar =
          SnackBar(content: Text("Please enter valid number of questions"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cBgColor,
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  NeumorphTextField(
                    controller: _titleController,
                    textInputType: TextInputType.text,
                    hintText: 'Title',
                  ),
                  NeumorphTextField(
                    hintText: 'Total Questions',
                    controller: _totalQuestionController,
                    textInputType: TextInputType.number,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('Total MCQ Options'),
                          Text(
                            _totalMcqOptions.toString(),
                            style: TextStyle(
                              fontSize: 70,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          NeumorphCiruclarIconButton(
                            increaseOptionCallback: increaseTotalMcqOptions,
                            neumorphIcon: Icons.arrow_drop_up,
                          ),
                          NeumorphCiruclarIconButton(
                            increaseOptionCallback: decreaseTotalMcqOptions,
                            neumorphIcon: Icons.arrow_drop_down,
                          ),
                        ],
                      )
                    ],
                  ),
                  ColorChooseRow(
                      changeColor: changeColor,
                      changeOptionFormat: changeFormat),
                  NeumorphElevatedIconButton(
                      text: 'CREATE', onPressed: buttonOnPress),
                ],
              ),
            ),
          ),
        ));
  }
}
