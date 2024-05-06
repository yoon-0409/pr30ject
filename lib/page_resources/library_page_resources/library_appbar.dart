import 'package:flutter/material.dart';

class LibraryAppBar extends StatefulWidget implements PreferredSizeWidget{
  final paddingSize;

  const LibraryAppBar({super.key, required this.paddingSize});

  @override
  State<LibraryAppBar> createState() => _LibraryAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _LibraryAppBarState extends State<LibraryAppBar> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var paddingSize = widget.paddingSize;

    return AppBar(
      actions: [
        IconButton(
            onPressed: (){ print('library page : search button is pressed'); },
            icon: Icon(Icons.search),
            iconSize: screenSize.height / 16
        )
      ],
    );
  }
}
