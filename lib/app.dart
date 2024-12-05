import 'package:first_assignment/view/listview_homework.dart';
import 'package:first_assignment/view/student_output_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ListviewHomework(),
        '/output': (context) => const StudentOutputView(),
      },
    );
  }
}
