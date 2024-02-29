import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newproject/models/category.dart';
import 'package:newproject/models/music.dart';
import 'package:newproject/services/categoryoperations.dart';
import 'package:newproject/services/musicoperations.dart';

class Home extends StatelessWidget {
  Function _miniplayer;
  Home(this._miniplayer); //shorthand for constructors in dart
  //const Home({super.key});

  Widget createCategory(Categories cat) {
    return Container(
        color: Colors.blueGrey.shade400,
        child: Row(
          children: [
            Image.network(cat.imageurl, fit: BoxFit.cover),
            Padding(padding: EdgeInsets.only(left: 10)),
            Text(
              cat.name,
              style: TextStyle(color: Colors.black),
            )
          ],
        ));
  }

  Widget createMusic(Music mus) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          padding: EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              _miniplayer(mus);
            },
            child: Image.network(
              mus.songimageURL,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(mus.songname),
        Text(mus.songdescription)
      ],
    );
  }

  Widget createMusicList(String music) {
    //How the ListView widget works different from Gridview in terms of the code
    List<Music> musiclist = musicOperations.getMusic();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          music,
          style: TextStyle(fontSize: 40),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctxt, index) {
              return createMusic(musiclist[index]);
            },
            itemCount: musiclist.length,
          ),
        )
      ],
    );
  }

  createCategoryList() {
    List<Categories> catlist = CategoryOperations.getCategories();
    List<Widget> categories =
        catlist.map((Categories category) => createCategory(category)).toList();
    return categories;
  } /*maps the category list(in categoryoperations.dart) to the createcCategoryfunction and creates a usable list of containers from them*/

  Widget grid1() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 400,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        children: createCategoryList(),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }

  Widget homeappbar(String message) {
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
        Icon(Icons.settings)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            homeappbar('HOME'),
            SizedBox(
              height: 10,
            ),
            grid1(),
            createMusicList('Made for you'),
            createMusicList('Popular now'),
            createMusicList('New Releases for you')
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.purpleAccent,
          Colors.pinkAccent,
          Colors.redAccent
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      ),
    );
  }
}
