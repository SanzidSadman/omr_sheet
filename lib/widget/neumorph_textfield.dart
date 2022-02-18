import 'package:flutter/material.dart';
import 'package:mcq_app/constants/constants.dart';
import 'package:mcq_app/theme/colors.dart';
import 'package:mcq_app/theme/shadow.dart';

class NeumorphTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? hintText;
  const NeumorphTextField({
    Key? key,
    this.hintText,
    required this.controller,
    required this.textInputType,
  }) : super(key: key);

  @override
  State<NeumorphTextField> createState() => _NeumorphTextFieldState();
}

class _NeumorphTextFieldState extends State<NeumorphTextField> {
  bool isTapped = false;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      onFocusChange();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onFocusChange() {
    setState(() {
//!
      isTapped = !isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(pMediumPadding),
      child: Container(
        width: 300,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            boxShadow: isTapped
                ? neumorphShadowTextFieldFocused
                : neumorphShadowTextFieldUnfocused,
          ),
          duration: Duration(milliseconds: 300),
          child: TextFormField(
            controller: widget.controller,
            focusNode: _focusNode,
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
              hintText: widget.hintText,
              fillColor: cBgColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
