// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pr30ject_modified/model/book_detail_model.dart';

class BookStackWidget extends StatefulWidget {
  final BookDetailModel bookBlock;
  final index;
  const BookStackWidget(
      {super.key, required this.bookBlock, required this.index});

  @override
  State<BookStackWidget> createState() => _BookStackWidgetState();
}

class _BookStackWidgetState extends State<BookStackWidget> {
  Color _getRandomColor() {
    final random = Random();
    // 0부터 1 사이의 랜덤한 비율
    var t = random.nextDouble();
    // t = 0.;
    // 빨간색과 흰색 사이의 그라데이션을 계산
    final red = Color.lerp(Colors.red[400], Colors.white70, t);

    return red ?? Colors.white; // 결과 색상
  }

  double brightness(Color color) {
    return (color.red * 0.299) + (color.green * 0.587) + (color.blue * 0.114);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var bookBlock = widget.bookBlock;
    var bookHeight = double.tryParse(bookBlock.pages);
    var defaultBlockHeight = screenSize.height / 35;
    var colorScale = _getRandomColor();
    var randomPadding = Random().nextDouble() * 20;
    randomPadding = randomPadding < 10 ? randomPadding * 2 : randomPadding;
    randomPadding = widget.index == 0
        ? randomPadding * 0
        : Random().nextDouble() <= 0.5
            ? randomPadding * -1
            : randomPadding * 1;
    return Center(
      child: SizedBox(
        width: screenSize.width * 0.5,
        height: (bookHeight == null || bookHeight / 5 < defaultBlockHeight)
            ? defaultBlockHeight
            : bookHeight / 5,
        child: Transform.translate(
          offset: Offset(randomPadding, 0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorScale,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0, // 그림자 제거
                    backgroundColor: Colors.transparent, // 배경색 투명
                    shadowColor: Colors.transparent, // 그림자 색상 투명
                    shape: RoundedRectangleBorder(), // 테두리 각진 형태
                    padding: EdgeInsets.all(0)),
                onPressed: () {
                  Navigator();
                  print(bookBlock.title);
                },
                child: Text(
                  '${bookBlock.title}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      // color: Colors.white,
                      color: brightness(colorScale) > 200.0
                          ? Colors.grey[700]
                          : Colors.white,
                      fontSize: screenSize.width * 0.035,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
              )),
        ),
      ),
    );
  }
}
