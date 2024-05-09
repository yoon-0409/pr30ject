import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr30ject_modified/model/book_model.dart';
import 'package:pr30ject_modified/page_resources/home_page_resources/book_detail_screen.dart';

class BookWidget extends StatelessWidget {
  final Book book;
  BookWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    var imgURL = book.imgURL;
    var title = book.title;
    var author = book.author.toString().length < 5
        ? book.author.toString()
        : book.author
            .toString()
            .substring(0, book.author.toString().length - 5);
    ;
    var foreword = book.foreword;
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7), // 그림자의 색상
            spreadRadius: 0, // 그림자의 확산 정도
            blurRadius: 5, // 그림자의 흐림 정도
            offset: Offset(0, 4), // 그림자의 위치 (x, y))
          ),
        ],
      ),
      height: screenSize.height / 8,
      // color: Colors.amber,
      margin: EdgeInsets.only(bottom: screenSize.height / 80),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          padding: MaterialStatePropertyAll(
            EdgeInsets.all(0),
          ),
          backgroundColor: MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookDetailScreen(
                        book: book,
                        // itemId: book.itemId,
                      )));
        },
        child: Container(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Transform.translate(
                  offset: Offset(-5, 1), //이미지 절대 이동
                  child: Image.network(
                    width: screenSize.width / 4.5,
                    fit: BoxFit.fill,
                    '$imgURL',
                    errorBuilder: (context, error, stackTrace) {
                      // 이미지 로드 실패 시 기본 이미지 표시
                      return Image.network(
                          'https://img.icons8.com/ios/100/no-image.png'); // 기본 이미지
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //제목
                        '${title}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: screenSize.width * 0.04,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff444b55),
                        ),
                      ),
                      Text(
                        //지은이
                        '$author',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: screenSize.width * 0.035,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        //책 설명
                        '$foreword',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: screenSize.width * 0.03,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
