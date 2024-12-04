import 'package:flutter/material.dart';

class Containerview extends StatelessWidget {
  const Containerview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
          child: Center(
        child: Container(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                )),
            child: const Text("i am container"),
          ),
        ),
      )),
    );
  }
}
