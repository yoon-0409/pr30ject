import 'package:flutter/material.dart';
import 'package:pr30ject_modified/model/book_model.dart';
import 'package:pr30ject_modified/page_resources/home_page_resources/book_explanation.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;
  BookDetailScreen({
    super.key,
    required this.book,
  });

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: screenSize.width * 0.07,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  '저장',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.w800,
                    color: Color(0xfff17374),
                  ),
                ),
              ),
            ],
          ),
          body: BookExplanation(
            book: widget.book,
          ),
        ),
      ),
    );
  }
}
