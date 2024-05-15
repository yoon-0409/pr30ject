import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoPage extends StatefulWidget {
  final double paddingSize;

  const MemoPage({Key? key, required this.paddingSize}) : super(key: key);

  @override
  State<MemoPage> createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MemoPage> {
  int _selectedIndex = 0; // 선택된 버튼 인덱스를 저장할 변수

  bool viewStack = false; // 버튼 클릭에 따른 상태를 저장할 변수

  void _toggleButton() {
    setState(() {
      viewStack = !viewStack;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var paddingSize = widget.paddingSize;

    // 스택 쌓기 및 리스트 형 보기 버튼에 대한 스타일
    final stackBookStyle = TextStyle(
      fontSize: screenSize.height * 0.02,
      fontWeight: FontWeight.w500,
    );

    return Scaffold(
      appBar: AppBar(
        actions: [],
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
                  '기록',
                  style: TextStyle(
                    fontSize: screenSize.height * 0.045,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // 쌓아보기 및 리스트형 보기 버튼
            Row(
              children: [
                Container(
                  height: screenSize.height * 0.06,
                  width: screenSize.width * 0.5 - paddingSize,
                  child: ElevatedButton(
                    onPressed: () {
                      if (viewStack == false) {
                        _toggleButton();
                        print(viewStack);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor:
                          viewStack ? Color(0xfff17374) : Color(0xfff2f2f2),
                      foregroundColor:
                          viewStack ? Colors.white : Color(0xfff17374),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      '나의 메모',
                      style: stackBookStyle,
                    ),
                  ),
                ),
                Container(
                  height: screenSize.height * 0.06,
                  width: screenSize.width * 0.5 - paddingSize,
                  child: ElevatedButton(
                    onPressed: () {
                      if (viewStack == true) {
                        _toggleButton();
                        print(viewStack);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: viewStack == false
                          ? Color(0xfff17374)
                          : Color(0xfff2f2f2),
                      foregroundColor: viewStack == false
                          ? Colors.white
                          : Color(0xfff17374),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      '차트 보기',
                      style: stackBookStyle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}