import 'package:first_assignment/core/common/my_cardview.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 1; i < 11; i++) ...{
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.blue,
                        content: Text("you press the card"),
                        duration: Duration(seconds: 3),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: MyCard(
                    title: 'card $i',
                    color: i % 2 == 0 ? Colors.green : Colors.amber,
                  ),
                )
              }
            ],
          ),
        ),
      ),
    );
  }
}
