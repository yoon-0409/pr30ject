// ignore_for_file: prefer_const_constructors, avoid_print,
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr30ject_modified/model/book_model.dart';
import 'package:pr30ject_modified/page_resources/home_page_resources/home_search_screen.dart';

class HomeMain extends StatefulWidget {
  List<Book> books = [
    Book.fromMap({'title': '인생박물관', 'pages': 304}),
    Book.fromMap({'title': 'CODE코드', 'pages': 624}),
    Book.fromMap({'title': '인생박물관', 'pages': 304})
  ];

  final paddingSize;
  HomeMain({super.key, required this.paddingSize});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  bool viewStack = true;

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
    var books = widget.books;
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
                      )),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          Text('책 검색하기'),
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
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ElevatedButton(onPressed: () {}, child: Text(''))],
              ),
            ),
          )
        ],
      ),
    );
  }
}
