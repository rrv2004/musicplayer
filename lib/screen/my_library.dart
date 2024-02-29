import 'package:flutter/material.dart';

class MyLibrary extends StatelessWidget {
  const MyLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color.fromARGB(255, 105, 11, 122),
        Color.fromARGB(255, 160, 67, 98),
        const Color.fromARGB(255, 147, 5, 5)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }
}
