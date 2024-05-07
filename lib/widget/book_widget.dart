import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: () {},
        child: Container(
          height: screenSize.height / 8,
          color: Colors.amber,
        ),
      ),
    );
  }
}
