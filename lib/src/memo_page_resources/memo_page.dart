import 'package:flutter/material.dart';

import '../bottom_navigation_bar.dart';

class MyMemo extends StatefulWidget {
  const MyMemo({super.key});

  @override
  State<MyMemo> createState() => _MyMemoState();
}

class _MyMemoState extends State<MyMemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('memo page app bar')),
      body: Container(child: Text('memo page'), alignment: Alignment.center,),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
