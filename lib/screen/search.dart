import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  Widget searchappbar(String message) {
    return AppBar(
      title: Text(
        message,
        style: TextStyle(
            fontStyle: FontStyle.italic,
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 40),
      ),
      backgroundColor: Colors.transparent,
      actions: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/defaultavatar.png'),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [searchappbar('SEARCH')],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 99, 1, 116),
        Color.fromARGB(255, 85, 36, 99),
        Color.fromARGB(210, 70, 24, 98)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }
}
