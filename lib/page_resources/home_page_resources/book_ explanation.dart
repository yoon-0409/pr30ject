// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pr30ject_modified/model/api_adapter.dart';
import "package:pr30ject_modified/model/book_model.dart";
import 'package:http/http.dart' as http;

class BookExplanation extends StatefulWidget {
  final Book book;
  const BookExplanation({
    super.key,
    required this.book,
  });

  @override
  State<BookExplanation> createState() => _BookExplanationState();
}

class _BookExplanationState extends State<BookExplanation> {
  bool isloading = false;
  var apiKey = 'ttbquddbs04090915001';
  var title = '';
  var bookDetail = BookDetail.init();
  _fetchBooks() async {
    setState(() {
      print('loading');
      isloading = true;
    });
    try {
      print('isbn = ${bookDetail.isbn}');
      print('imgURL = ${bookDetail.imgURL}');
      final uri =
          Uri.parse("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx").replace(
        queryParameters: {
          'ttbkey': '${apiKey}',
          'itemIdType': 'ISBN',
          'ItemId':
              '${widget.book.isbn == '' ? widget.book.isbn13 : widget.book.isbn}',
          'output': 'JS',
          'Version': '20131101',
          'OptResult': 'ebookList,usedList,reviewList',
          'Cover': 'Big'
        },
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        setState(() {
          bookDetail = parseBookDetail(utf8.decode(response.bodyBytes));
          // print(books);
          print('${bookDetail.title}');
          print('${bookDetail.pages}');
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

  @override
  void initState() {
    super.initState();
    _fetchBooks(); // 위젯이 처음 생성될 때 한 번만 호출됩니다.
  }

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var author = bookDetail.author.toString().length < 5
        ? bookDetail.author.toString()
        : bookDetail.author
            .toString()
            .substring(0, bookDetail.author.toString().length - 5);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isloading)
                Column(
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.4,
                    ),
                    CircularProgressIndicator(),
                  ],
                )
              else if (bookDetail.title == 'error')
                Text("Error")
              else
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenSize.height * 0.03,
                      ),
                      SizedBox(
                        width: screenSize.width * 0.9 -
                            (bookDetail.title.length / 10) * 14,
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            '${bookDetail.title}',
                            style: TextStyle(
                              fontSize: screenSize.width * 0.055,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: Image.network(
              width: screenSize.width / 2.2,
              fit: BoxFit.fitHeight,
              '${bookDetail.imgURL}',
              errorBuilder: (context, error, stackTrace) {
                // 이미지 로드 실패 시 기본 이미지 표시
                return Image.network(
                    'https://img.icons8.com/ios/100/no-image.png'); // 기본 이미지
              },
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.005,
          ),
          Text(
            '$author',
            style: TextStyle(
                fontSize: screenSize.width * 0.035,
                fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Divider(
              height: screenSize.height * 0.07, // 구분선의 전체 높이
              thickness: 3, // 구분선의 두께
              color: Colors.grey, // 구분선 색상
              indent: screenSize.width * 0.05, // 좌측 여백
              endIndent: screenSize.width * 0.05, // 우측 여백
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    '${bookDetail.publisher}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 35),
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    '${bookDetail.isbn}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    '${bookDetail.isbn13}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    '${bookDetail.pages}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
