// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';

class HomeMain extends StatefulWidget {
  final paddingSize;

  const HomeMain({super.key, required this.paddingSize});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var paddingSize = widget.paddingSize;

    return Container(
      padding: EdgeInsets.fromLTRB(paddingSize, 0, paddingSize, 0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.amber,
                  height: screenSize.height * 0.04,
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.01,
              ),
              IconButton(
                onPressed: () {
                  print('카메라!');
                },
                icon: Icon(Icons.photo_camera),
                iconSize: screenSize.height / 16,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.amber,
                child: TextButton(
                  onPressed: () {
                    print('전체보기!');
                  },
                  child: Text(
                    '전체보기',
                    style: TextStyle(fontSize: screenSize.width * 0.065),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.amber,
              ),
            ],
          ),
          Container(
            child: Text('widget 들어올자리'),
          )
        ],
      ),
    );
  }
}
