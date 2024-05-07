import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:pr30ject_modified/model/api_adapter.dart';
import 'dart:convert';

import 'package:pr30ject_modified/model/book_model.dart';

class SearchPage extends StatefulWidget {
  final paddingSize;

  SearchPage({super.key, required this.paddingSize});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // List<Book> books = [];
  bool isloading = false;
  var apiKey = '';
  var title = '';
  _fetchBooks() async {
    setState(() {
      isloading = true;
    });
    try {
      final response = await http.post(
          Uri.parse("http://www.aladin.co.kr/ttb/api/ItemSearch.aspx"),
          body: {
            "ttbKey": apiKey,
            "Query": "CODE",
            "QueryType": "Keyword",
            "MaxResults": 10,
            "start": 1,
            "SearchTarget": "Book",
            "output": "js",
            "Version": 20131101,
            "Sort": "Accuracy"
          });
      if (response.statusCode == 200) {
        setState(() {
          books = parseBooks(utf8.decode(response.bodyBytes));
          isloading = false;
        });
      } else {
        throw Exception('검색 실패다 쌍년아');
      }
    } catch (e) {
      setState(() {
        isloading = false;
      });
      print('Error fetching books: $e');
    }
  }

  List<Book> books = [
    Book.fromMap({
      "title": "1",
      "imgURL": "https://img.icons8.com/ios/100/no-image.png",
      "author": "나다 이년아",
      "foreword": "배병윤이 코딩하다 빡쳐서 쓴 글"
    }),
    Book.fromMap({
      "title": "1",
      "imgURL": "https://img.icons8.com/ios/100/no-image.png",
      "author": "나다 이년아",
      "foreword": "배병윤이 코딩하다 빡쳐서 쓴 글"
    }),
    Book.fromMap({
      "title": "1",
      "imgURL": "https://img.icons8.com/ios/100/no-image.png",
      "author": "나다 이년아",
      "foreword": "배병윤이 코딩하다 빡쳐서 쓴 글"
    }),
    Book.fromMap({
      "title": "1",
      "imgURL": "https://img.icons8.com/ios/100/no-image.png",
      "author": "나다 이년아",
      "foreword": "배병윤이 코딩하다 빡쳐서 쓴 글"
    })
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var paddingSize = widget.paddingSize;
    return Container(
      // padding: EdgeInsets.only(top: 10),
      child: Scaffold(
        appBar: AppBar(
          title: Text('책 검색하기'),
          leading: IconButton(
            onPressed: () {
              Navigator.popUntil(
                  context, (route) => route.isFirst); // 첫 화면으로 바로 이동
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              height: screenSize.height * 0.05,
              // color: Colors.amber,
              child: SearchBar(
                onSubmitted: (text) {
                  setState(() {
                    title = text;
                  });
                  _fetchBooks();
                  print('입력된 텍스트 $text');
                },
                hintText: '어떤책을 읽었니 빗취야',
                textInputAction: TextInputAction.search,
                backgroundColor: MaterialStatePropertyAll(Color(0xfff2f2f2)),
                shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
