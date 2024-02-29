import 'package:flutter/material.dart';

class MyLibrary extends StatelessWidget {
  const MyLibrary({super.key});

  Widget mylibrarybar(String message) {
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
        Icon(Icons.search_outlined),
        Padding(padding: EdgeInsets.only(right: 5)),
        Icon(Icons.playlist_add_outlined)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          mylibrarybar('MY LIBRARY'),
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color.fromARGB(255, 105, 11, 122),
        Color.fromARGB(255, 160, 67, 98),
        const Color.fromARGB(255, 147, 5, 5)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }
}
