import 'package:flutter/material.dart';
import '../bottom_navigation_bar.dart';

class MySetting extends StatefulWidget {
  const MySetting({super.key});

  @override
  State<MySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('setting page app bar')),
      body: Container(child: Text('setting page'), alignment: Alignment.center,),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
