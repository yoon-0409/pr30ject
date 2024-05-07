// ignore_for_file : prefer_const_construction,
import 'package:flutter/material.dart';

class LibrarySearchPage extends StatefulWidget {
  final paddingSize;

  const LibrarySearchPage({super.key, this.paddingSize});

  @override
  State<LibrarySearchPage> createState() => _LibrarySearchPageState();
}

class _LibrarySearchPageState extends State<LibrarySearchPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var paddingSize = widget.paddingSize;

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_sharp),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Container(
                alignment: Alignment.center,
                child: const Text(
                  '서재 검색',
                  textAlign: TextAlign.center,
                ))),
        body: Container(
            child: Column(
          children: [
            Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: Color(0xfff2f2f2)),
                child: TextField(
                    decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: '검색어를 입력해주세요',
                )))
          ],
        )));
  }
}
