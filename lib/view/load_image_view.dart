import 'package:flutter/material.dart';

class LoadImageView extends StatelessWidget {
  const LoadImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Page"),
        ),
        body: SafeArea(
            child: SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.height * .5,
          child: Image.asset(
            "assets/images/image1.jpg",
            fit: BoxFit.fill,
          ),
        )));
  }
}


// SingleChildScrollView(
//         child: Column(
//           children: [
//             Image.asset("assets/images/image1.jpg"),
//             Image.asset("assets/images/image2.jpg"),
//             Image.asset("assets/images/image1.jpg"),
//             Image.asset("assets/images/image2.jpg"),
//           ],
//         ),
//       ),