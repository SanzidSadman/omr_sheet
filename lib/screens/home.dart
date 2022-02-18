import 'package:flutter/material.dart';
import 'package:mcq_app/theme/colors.dart';
import 'package:mcq_app/widget/neumorph_large_icon_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBgColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NeumorphLargeIconButton(neumorphIcon: Icons.create),
          ],
        ),
      ),
    );
  }
}
