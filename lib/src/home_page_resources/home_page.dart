import 'package:flutter/material.dart';
import 'package:pr30ject_modified/src/bottom_navigation_bar.dart';
import 'package:pr30ject_modified/src/character_page_resources/character_page.dart';
import 'package:pr30ject_modified/src/library_page_resources/library_page.dart';
import 'package:pr30ject_modified/src/memo_page_resources/memo_page.dart';
import 'package:pr30ject_modified/src/setting_page_resources/setting_page.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('main home app bar')),
      body: Container(child: Text('main home'), alignment: Alignment.center,),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
