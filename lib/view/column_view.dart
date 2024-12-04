import 'package:flutter/material.dart';

class ColumnView extends StatelessWidget {
  const ColumnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('column'),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Icon(Icons.star, size: 50),
            // Icon(Icons.star, size: 50),
            // Spacer(),
            // Icon(Icons.star, size: 50),
            ElevatedButton(onPressed: () => (), child: const Text("button1")),
            ElevatedButton(onPressed: () => (), child: const Text("button2")),
            ElevatedButton(onPressed: () => (), child: const Text("button3")),
          ],
        ),
      ),
    );
  }
}
