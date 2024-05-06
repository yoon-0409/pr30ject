// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pr30ject_modified/home_page_resources/home_appBar.dart';
import 'package:pr30ject_modified/page_resources/home_page_resources/home_screen.dart';
import 'package:pr30ject_modified/page_resources/library_page_resources/library_appbar.dart';
import 'package:pr30ject_modified/page_resources/memo_page_resources/memo_appbar.dart';
import 'package:pr30ject_modified/src/bottom_navigation_bar.dart';

import '../page_resources/library_page_resources/library_screen.dart';

//bottom button에 따라 전환할 bodies
List screens(var paddingSize) {
  return [
    HomeMain(paddingSize: paddingSize),
    MyLibrary(paddingSize:paddingSize),
    Text('캐릭터'),
    Text('기록'),
    Text('설정'),
  ];
}

//bottom button에 따라 전환할 AppBars:
//Library, memo만 구현해 놨음.
List appBars(var paddingSize){
  return [
    AppBar(title: Text('home app bar')),
    LibraryAppBar(paddingSize: paddingSize),
    AppBar(title: Text('character app bar')),
    MemoAppBar(paddingSize: paddingSize),
    AppBar(title: Text('settings app bar'))
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
          appBar: appBars(paddingSize)[currentIndex],

          body: Center(
          child: screens(paddingSize)[(currentIndex)],
        ),

          bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: _onBottomNavTap,
        ),
        ),
      ),
    );
  }
}
