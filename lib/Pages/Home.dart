import 'package:flutter/material.dart';
import '../MyHomePage.dart';
import 'dart:math' as math;

class Home extends StatelessWidget {
  bool isTop(int num) {
    return num < 18;
  }

  bool isLeft(int num) {
    return num % 6 < 3;
  }

  Color? generateColor(int index) {
    int thisColor = (isTop(index) ? 0 : 2) + (isLeft(index)? 0 : 1);
    switch(thisColor) {
      case 0:
        return Colors.red[(3 - index % 6) * 100 + (4 - (index / 6).ceil()) * 100];
      case 1:
        return Colors.yellow[(index % 6 - 2)* 100 + (4 - (index / 6).ceil()) * 100];
      case 2:
        return Colors.blue[(2 - index % 6) * 100 + (index / 6).ceil() * 100];
      case 3:
        return Colors.green[(index % 6 - 4) * 100 + (index / 6).ceil() * 100];
    }

  }

  @override
  Widget build(BuildContext context) {

    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 6,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(36, (index) {

        return Container(
          width: 42,
          height: 42,
          padding: const EdgeInsets.all(3.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: generateColor(index),
            ),
          ),
        );
      }),
    );
    // return Text(
    //   'Home',
    //   style: getOptionStyle(),
    // );
  }
}
