import 'package:flutter/material.dart';
import 'package:pr30ject_modified/src/setting_page_resources/setting_page.dart';

import 'bottom_navigation_bar.dart';
import 'character_page_resources/character_page.dart';
import 'home_page_resources/home_page.dart';
import 'library_page_resources/library_page.dart';
import 'memo_page_resources/memo_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  static var _pageIndex=0;

  static List<Widget> _pageList=[
    MyHome(),
    MyLibrary(),
    MyCharacter(),
    MyMemo(),
    MySetting()
  ];

  @override
  Widget build(BuildContext context) {
    return _pageList[_pageIndex];
  }
}
