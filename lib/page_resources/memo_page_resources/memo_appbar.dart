import 'package:flutter/material.dart';

class MemoAppBar extends StatefulWidget implements PreferredSizeWidget{
  final paddingSize;

  const MemoAppBar({super.key, required this.paddingSize});

  @override
  State<MemoAppBar> createState() => _MemoAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MemoAppBarState extends State<MemoAppBar> {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var paddingSize = widget.paddingSize;

    return AppBar();
  }
}
