import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BottomGrid.dart';

class GridButton extends StatefulWidget {
  GridButton({Key? key, required this.index}) : super(key: key);
  final int index;

  static bool isTop(int num) {
    return num < 18;
  }

  static bool isLeft(int num) {
    return num % 6 < 3;
  }

  static Color? generateColor(int index) {
    int thisColor = (isTop(index) ? 0 : 2) + (isLeft(index)? 0 : 1);
    switch(thisColor) {
      case 0:
        return Colors.red[(3 - index % 6) * 100 +
            (4 - (index / 6).ceil()) * 100];
      case 1:
        return Colors.yellow[(index % 6 - 2) * 100 +
            (4 - (index / 6).ceil()) * 100];
      case 2:
        return Colors.blue[(2 - index % 6) * 100 + (index / 6).ceil() * 100];
      case 3:
        return Colors.green[(index % 6 - 4) * 100 + (index / 6).ceil() * 100];
    }
  }

  String getEmotion(int index) {
    List<String> emotions = [
      "Enraged",
      "Frustrated",
      "Tense",
      "Cheerful",
      "Festive",
      "Exhilarated",
      "Livid",
      "Frightened",
      "Irritated",
      "Lively",
      "Motivated",
      "Inspired",
      "Anxious",
      "Worried",
      "Uneasy",
      "Happy",
      "Focused",
      "Blissful",
      "Disgusted",
      "Disappointed",
      "Down",
      "Calm",
      "Secure",
      "Miserable",
      "Lonely",
      "Tired",
      "Relaxed",
      "Restful",
      "Blessed",
      "Depressed",
      "Exhausted",
      "Drained",
      "Sleepy",
      "Peaceful",
      "Serene"
    ];

    return emotions[index];

  }

  @override
  _GridButtonState createState() => _GridButtonState();
}

class _GridButtonState extends State<GridButton> {
  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        String pos = getEmotion(widget.index);
        SnackBar snackBar = SnackBar(content: Text(pos));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: GridButton.generateColor(widget.index),
        ),
      ),
    );
  }
}