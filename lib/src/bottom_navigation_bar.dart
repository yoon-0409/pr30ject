import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr30ject_modified/src/setting_page_resources/setting_page.dart';

import 'character_page_resources/character_page.dart';
import 'home_page_resources/home_page.dart';
import 'library_page_resources/library_page.dart';
import 'memo_page_resources/memo_page.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: _MyAppState._pageList[_MyAppState._pageIndex],
        onTap: (value) {
          setState(() {
            _pageIndex = value;
            print(_pageIndex);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded), label: "library"),
          BottomNavigationBarItem(icon: Icon(Icons.adb), label: "characters"),
          BottomNavigationBarItem(icon: Icon(Icons.create), label: "memo"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings")
        ],
    );
  }
}
