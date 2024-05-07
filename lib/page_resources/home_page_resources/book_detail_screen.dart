import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({super.key, ISBN});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('책입니다'),
    );
  }
}
