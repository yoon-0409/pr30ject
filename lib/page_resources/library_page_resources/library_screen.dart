// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';

class MyLibrary extends StatefulWidget {
  final paddingSize;

  const MyLibrary({super.key, required this.paddingSize});

  @override
  State<MyLibrary> createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MyLibrary> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var paddingSize = widget.paddingSize;

    return Container(
        padding: EdgeInsets.fromLTRB(paddingSize, 0, paddingSize, 0),
        child: Column(
          children: [
            // 나의 서재 텍스트
            Flexible(
                child: Container(
                    child: Text('나의 서재', style: TextStyle(fontSize: 30)),
                    alignment: Alignment.centerLeft),
                flex: 1),

            // 화면전환 버튼
            Flexible(
              child: Row(
                children: [
                  TextButton(onPressed: () {}, child: Text('전체')),
                  TextButton(onPressed: () {}, child: Text('읽은 책')),
                  TextButton(onPressed: () {}, child: Text('읽고 있는 책')),
                  TextButton(onPressed: () {}, child: Text('읽고 싶은')),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              flex: 1,
            ),

            // 실제 보유한 책이 나오는 container
            Flexible(
              child: Container(
                color: Colors.grey,
              ),
              flex: 8,
            ),
          ],
        ));
  }
}
