import 'package:flutter/material.dart';

class FlexibleExpandView extends StatelessWidget {
  const FlexibleExpandView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 700,
                width: double.infinity,
                color: Colors.yellow,
              ),
            ),
            Expanded(
              child: Container(
                height: 300,
                width: double.infinity,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
