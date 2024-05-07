// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return BottomNavigationBar(
        iconSize: screenSize.height / 32,
        currentIndex: widget.currentIndex,
        onTap: widget.onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: '서재',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.man_2),
            label: '캐릭터',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: '메모',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
        selectedItemColor: Color(0xfff17374),
        unselectedItemColor: Color(0xff737373),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
        selectedFontSize: screenSize.width * 0.035);
  }
}
