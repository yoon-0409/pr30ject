// ignore_for_file: prefer_const_constructors, avoid_print,
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pr30ject_modified/model/book_detail_model.dart';
import 'package:pr30ject_modified/page_resources/home_page_resources/book_detail_screen.dart';
import 'package:pr30ject_modified/page_resources/home_page_resources/home_search_screen.dart';
import 'package:pr30ject_modified/widget/book_stack_widget.dart';

class HomeMain extends StatefulWidget {
  final paddingSize;
  HomeMain({super.key, required this.paddingSize});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  bool viewStack = true;
  List<BookDetailModel> bookBlocks = [
    BookDetailModel.fromMap({
      "title": '박물관1',
      "cover": 'https://img.icons8.com/ios/100/no-image.png',
      "author": '나다 이 씹새야',
      "foreword": '',
      "publisher": '경산위대한',
      "isbn": '',
      "isbn13": '',
      "itemPage": '',
    }),
    BookDetailModel.fromMap({
      "title": '박물관2',
      "cover": 'https://img.icons8.com/ios/100/no-image.png',
      "author": '나다 이 씹새야',
      "foreword": '',
      "publisher": '경산위대한',
      "isbn": '',
      "isbn13": '',
      "itemPage": '300',
    }),
    BookDetailModel.fromMap({
      "title": '박물관3',
      "cover": 'https://img.icons8.com/ios/100/no-image.png',
      "author": '나다 이 씹새야',
      "foreword": '',
      "publisher": '경산위대한',
      "isbn": '',
      "isbn13": '',
      "itemPage": '500',
    }),
    BookDetailModel.fromMap({
      "title": '박물관4',
      "cover": 'https://img.icons8.com/ios/100/no-image.png',
      "author": '나다 이 씹새야',
      "foreword": '',
      "publisher": '경산위대한',
      "isbn": '',
      "isbn13": '',
      "itemPage": '100',
    }),
    BookDetailModel.fromMap({
      "title": '박물관5',
      "cover": 'https://img.icons8.com/ios/100/no-image.png',
      "author": '나다 이 씹새야',
      "foreword": '',
      "publisher": '경산위대한',
      "isbn": '',
      "isbn13": '',
      "itemPage": '1000',
    }),
  ];
  void _toggleButton() {
    setState(() {
      viewStack = !viewStack;
    });
  }

  var _userBookCount = 1;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var paddingSize = widget.paddingSize;

    var stackBookStyle = TextStyle(
      fontSize: screenSize.width * 0.037,
      fontWeight: FontWeight.bold,
    );
    return Container(
      padding: EdgeInsets.fromLTRB(paddingSize, 10, paddingSize, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    height: screenSize.height * 0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SearchPage(
                                    paddingSize: paddingSize,
                                  )),
                        );
                      },
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          Color(0xfff2f2f2),
                        ),
                        elevation: MaterialStatePropertyAll(0),
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.all(5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: screenSize.width * 0.06,
                            color: Colors.grey[400],
                          ),
                          Text(
                            '책 검색하기',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: screenSize.width * 0.045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                width: screenSize.width * 0.03,
              ),
              Container(
                margin: EdgeInsets.only(top: 6),
                child: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        duration: Duration(milliseconds: 1500),
                        content: Text(
                          '스샷은 나중에 지원해줄게',
                          style: TextStyle(fontSize: screenSize.width * 0.04),
                        ),
                      ),
                    );
                    print('카메라!');
                  },
                  color: Color(0xfff17374),
                  icon: Icon(Icons.photo_camera),
                  iconSize: screenSize.height / 32,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: TextButton(
                  onPressed: () {
                    print('전체 보기!');
                  },
                  child: Text(
                    '전체 보기 ($_userBookCount)',
                    style: TextStyle(
                        fontSize: screenSize.width * 0.065,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                // color: Colors.amber,
                height: screenSize.height * 0.06,
                width: screenSize.width * 0.5 - paddingSize,
                child: ElevatedButton(
                  onPressed: () {
                    if (viewStack == false) {
                      _toggleButton();
                      print(viewStack);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    backgroundColor:
                        viewStack ? Color(0xfff17374) : Color(0xfff2f2f2),
                    foregroundColor:
                        viewStack ? Colors.white : Color(0xfff17374),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    '쌓아보기',
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
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: viewStack == false
                        ? Color(0xfff17374)
                        : Color(0xfff2f2f2),
                    foregroundColor:
                        viewStack == false ? Colors.white : Color(0xfff17374),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    '리스트형 보기',
                    style: stackBookStyle,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  0, screenSize.height * 0.001, 0, screenSize.height * 0.001),
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: bookBlocks.length,
                      itemBuilder: (context, index) {
                        return BookStackWidget(
                            bookBlock: bookBlocks[index], index: index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
