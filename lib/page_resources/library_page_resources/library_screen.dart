// ignore_for_file: prefer_const_constructors,
import 'package:flutter/material.dart';
import 'package:pr30ject_modified/widget/book_widget.dart';

class MyLibrary extends StatefulWidget {
  final double paddingSize;

  const MyLibrary({Key? key, required this.paddingSize}) : super(key: key);

  @override
  State<MyLibrary> createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MyLibrary> {
  int _selectedIndex = 0; // 선택된 버튼 인덱스를 저장할 변수

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var paddingSize = widget.paddingSize;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              print('검색!');
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(paddingSize, 10, paddingSize, 0),
        child: Column(
          children: [
            // 나의 서재 텍스트
            Flexible(
              flex: 10,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '나의 서재',
                  style: TextStyle(
                    fontSize: screenSize.height * 0.045,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // 버튼 및 상단 일직선
            Flexible(
              flex: 10,
              child: Column(
                children: [
                  // 상단 일직선 -> 버튼 상태에 따라 색상 변경
                  Row(
                    children: [
                      _buildSegmentContainer(screenSize.width / 5, 0),
                      _buildSegmentContainer(screenSize.width / 4.5, 1),
                      _buildSegmentContainer(screenSize.width / 4.5, 2),
                      _buildSegmentContainer(screenSize.width / 4.5, 3),
                    ],
                  ),
                  // 화면전환 버튼
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTextButton(0, '전체'),
                      _buildTextButton(1, '읽은 책'),
                      _buildTextButton(2, '읽고 있는 책'),
                      _buildTextButton(3, '읽고 싶은'),
                    ],
                  ),
                ],
              ),
            ),

            // 실제 보유한 책이 나오는 container
            Flexible(
              flex: 80,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextButton(int index, String text) {
    // body 상단에 들어가는 body 전환버튼 builder
    // 선택된 버튼의 text 색은 검은색, 선택 안 되면 회색
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedIndex = index; // 버튼 인덱스 업데이트
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: _selectedIndex == index ? Colors.black : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildSegmentContainer(double width, int index) {
    // 버튼 위의 일직선
    // 버튼이 선택되면 상단의 일직선도 색과 굵기가 바뀜(selectedIndex 값에 따라 바뀜)
    return Container(
        width: width,
        height: _selectedIndex==index?2:0.5,
        color: _selectedIndex == index ? Color(0xfff17374) : Colors.grey,
      );
  }
}
