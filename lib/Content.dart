
import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/Characters.dart';

import './screens/Location.dart';


class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {

int _index = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> screens =  [
      Characters(),
      Location()
    ];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 71, 103, 1),
        title: Text("Rick and Morty",),
        centerTitle: true,
      ),
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color.fromRGBO(237,237,238, 1),
        backgroundColor: Color.fromRGBO(58, 71, 103, 1),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.android), title: Text("Personagens", style: TextStyle(
            color: Colors.white
          ),),),
          BottomNavigationBarItem(icon: Icon(Icons.gps_fixed), title: Text("Locais", style: TextStyle(
            color: Colors.white
          ),)),
        ],
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
