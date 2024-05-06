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
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_outlined),
          label: 'library',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.man_2),
          label: 'character',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'memo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'setting',
        ),
      ],
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.shifting,
    );
  }
}
