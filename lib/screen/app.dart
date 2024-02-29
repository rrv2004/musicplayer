import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:newproject/models/music.dart';
import 'package:newproject/screen/home.dart';
import 'package:newproject/screen/my_library.dart';
import 'package:newproject/screen/search.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  AudioPlayer _audioPlayer = new AudioPlayer();
  var tab = [];
  int tabIndex = 0;
  Music? song;
  Widget miniPlayer(Music? song) {
    this.song = song;
    setState(() {});
    if (song == null) {
      return SizedBox();
    }
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.amber,
      height: 50,
      width: deviceSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(song.songimageURL, fit: BoxFit.cover),
          Text(song.songname, style: TextStyle(color: Colors.blueAccent)),
          IconButton(
              onPressed: () async {
                await _audioPlayer.play(UrlSource(song.audioURL));
              },
              icon: Icon(
                Icons.play_arrow,
                color: Color.fromARGB(255, 50, 0, 144),
              ))
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tab = [Home(miniPlayer), Search(), MyLibrary()];
  }

  @override //UI BELOW THIS
  Widget build(BuildContext context) {
    return Scaffold(
      body: tab[tabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(song),
          BottomNavigationBar(
            currentIndex: tabIndex,
            onTap: (currentIndex) {
              tabIndex = currentIndex;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                label: "Search",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.library_books_outlined,
                    color: Colors.grey,
                  ),
                  label: 'My Library')
            ],
            backgroundColor: Colors.transparent,
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            selectedItemColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
