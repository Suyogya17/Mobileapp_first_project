import 'package:first_assignment/model/student.dart';
import 'package:first_assignment/view/calculator_view.dart';
import 'package:first_assignment/view/card_view.dart';
import 'package:first_assignment/view/listview_homework.dart';
import 'package:first_assignment/view/show_snack_bar_view.dart';
import 'package:first_assignment/view/student_individual_details_view.dart';
import 'package:first_assignment/view/student_output_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const ListviewHomework(),
      //   '/output': (context) => const StudentOutputView(),
      //   '/personview': (context) => const StudentPersonalView(),
      // },

      home: CalculatorView(),
    );
  }
}
