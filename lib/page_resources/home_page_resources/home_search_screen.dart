import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:pr30ject_modified/model/api_adapter.dart';
import 'dart:convert';

import 'package:pr30ject_modified/model/book_model.dart';
import 'package:pr30ject_modified/widget/book_widget.dart';

class SearchPage extends StatefulWidget {
  final paddingSize;

  SearchPage({super.key, required this.paddingSize});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Book> books = [];
  bool isloading = false;
  var apiKey = 'ttbquddbs04090915001';
  var title = '';

  _fetchBooks() async {
    setState(() {
      isloading = true;
    });
    try {
      final uri =
          Uri.parse("http://www.aladin.co.kr/ttb/api/ItemSearch.aspx").replace(
        queryParameters: {
          "ttbKey": apiKey,
          "Query": title,
          "QueryType": "Keyword",
          "MaxResults": "10",
          "start": "1",
          "SearchTarget": "Book",
          "output": "JS",
          "Version": "20131101",
          "Sort": "Accuracy",
          "Cover": "MidBig"
        },
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        setState(() {
          books = parseBooks(utf8.decode(response.bodyBytes));
          // print(books);
          isloading = false;
        });
      } else {
        print('검색실패');
        throw Exception('검색 실패다 쌍년아');
      }
    } catch (e) {
      setState(() {
        isloading = false;
      });
      print('Error fetching books: $e');
    }
  }

  // List<Book> books = [
  //   Book.fromMap({
  //     "title": "1",
  //     "imgURL": "https://img.icons8.com/ios/100/no-image.png",
  //     "author": "나다 이년아1",
  //     "foreword": "배병윤이 코딩하다 빡쳐서 쓴 글"
  //   }),
  // ];
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var paddingSize = widget.paddingSize;
    return Container(
      color: Colors.white,
      // padding: EdgeInsets.only(top: 10),
      child: Scaffold(
        appBar: AppBar(
          title: Text('책 검색하기'),
          leading: IconButton(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.popUntil(
                  context, (route) => route.isFirst); // 첫 화면으로 바로 이동
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(paddingSize, 0, paddingSize, 0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                height: screenSize.height * 0.05,
                // color: Colors.amber,
                child: SearchBar(
                  controller: _searchController,
                  trailing: [
                    IconButton(
                      onPressed: () {
                        _searchController.clear();
                      },
                      icon: Icon(Icons.cancel),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                    )
                  ],
                  leading: Icon(Icons.search),
                  onSubmitted: (text) {
                    setState(() {
                      title = text;
                    });
                    _fetchBooks();
                    print('입력된 텍스트 $title');
                  },
                  hintText: '어떤책을 읽었니 빗취야',
                  textInputAction: TextInputAction.search,
                  backgroundColor: MaterialStatePropertyAll(Color(0xfff2f2f2)),
                  shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(10))),
                ),
              ),
              if (isloading)
                Column(
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.38,
                    ),
                    CircularProgressIndicator(),
                  ],
                )
              else if (books.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: books.length, // 책 목록의 길이
                    itemBuilder: (context, index) {
                      return BookWidget(
                          book: books[index]); // 각 책에 대한 BookWidget 생성
                    },
                  ),
                )
              else
                Text('검색결과가 없습니다')
            ],
          ),
        ),
      ),
    );
  }
}
