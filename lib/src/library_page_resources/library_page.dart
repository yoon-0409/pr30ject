import 'package:flutter/material.dart';
import '../bottom_navigation_bar.dart';

class MyLibrary extends StatefulWidget {
  const MyLibrary({super.key});

  @override
  State<MyLibrary> createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MyLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('library page app bar')),
      body: Container(child: Text('library page'), alignment: Alignment.center,),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
