import 'package:flutter/material.dart';
import '../MyHomePage.dart';
import 'dart:math' as math;

class Home extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    const List<Color> colorss = [
      Colors.red,
      Colors.yellow,
      Colors.blue,
      Colors.green,

    ];

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
              color: index < 18 ? colorss[((index / 3).floor() % 4) % 2]
              : colorss[(((index / 3).floor() % 4)) % 2 + 2],
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
