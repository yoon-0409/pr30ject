// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pr30ject_modified/page_resources/home_page_resources/home_screen.dart';
import 'package:pr30ject_modified/page_resources/character_page_resources/character_screen.dart';
import 'package:pr30ject_modified/src/bottom_navigation_bar.dart';


List screens(var paddingSize) {
  return [
    HomeMain(paddingSize: paddingSize),
    Text('서재'),
    CharacterPage(paddingSize: paddingSize),
    Text('기록'),
    Text('설정'),
  ];
}

class MyAppPage extends StatefulWidget {
  const MyAppPage({super.key});

  @override
  State<MyAppPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  var currentIndex = 0;
  void _onBottomNavTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var paddingSize = screenSize.width / 21;
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Main',
        home: Scaffold(
          bottomNavigationBar: MyBottomNavigationBar(
            currentIndex: currentIndex,
            onTap: _onBottomNavTap,
          ),
          body: Center(
            child: screens(paddingSize)[(currentIndex)],
          ),
        ),
      ),
    );
  }
}