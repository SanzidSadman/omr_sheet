import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcq_app/screens/home.dart';
import 'package:mcq_app/screens/mcq_page_user.dart';
import 'package:mcq_app/widget/color_choose_row.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.bold).fontFamily,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/mcq_page_user': (context) => McqPageUser(
              mcqColor: Colors.black,
              title: 'TITLE',
              totalOptions: 2,
              totalQuestions: 5,
              optionFormat: OptionFormat.abc,
              answer: [],
            ),
      },
    );
  }
}
