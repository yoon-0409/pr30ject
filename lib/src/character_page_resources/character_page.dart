import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr30ject_modified/src/bottom_navigation_bar.dart';

class MyCharacter extends StatefulWidget {
  const MyCharacter({super.key});

  @override
  State<MyCharacter> createState() => _MyCharacterState();
}

class _MyCharacterState extends State<MyCharacter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('character page app bar')),
      body: Container(child: Text('character page'), alignment: Alignment.center,),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
