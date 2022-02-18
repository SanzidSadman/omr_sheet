import 'package:flutter/material.dart';

final neumorphShadow = [
  BoxShadow(
    color: Colors.grey[500]!,
    offset: Offset(4, 4),
    blurRadius: 15,
    spreadRadius: 1,
  ),
  BoxShadow(
    color: Colors.white,
    offset: Offset(-4, -4),
    blurRadius: 15,
    spreadRadius: 1,
  ),
];

final neumorphShadowMcq = [
  BoxShadow(
    color: Colors.grey[500]!,
    offset: Offset(4, 4),
    blurRadius: 10,
    spreadRadius: 2,
  ),
  BoxShadow(
    color: Colors.white,
    offset: Offset(-4, -4),
    blurRadius: 10,
    spreadRadius: 1,
  ),
];

final neumorphShadowTextFieldFocused = [
  BoxShadow(
    color: Colors.grey[500]!,
    offset: Offset(3, 3),
    blurRadius: 18,
    spreadRadius: 2,
  ),
  BoxShadow(
    color: Colors.white,
    offset: Offset(-3, -3),
    blurRadius: 18,
    spreadRadius: 2,
  ),
];

final neumorphShadowTextFieldUnfocused = [

  BoxShadow(
    color: Colors.grey[500]!,
    offset: Offset(3, 3),
    blurRadius: 18,
    spreadRadius: 1,
  ),
  BoxShadow(
    color: Colors.white,
    offset: Offset(-3, -3),
    blurRadius: 18,
    spreadRadius: 1,
  ),
  
];
