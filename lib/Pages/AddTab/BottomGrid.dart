import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GridButton.dart';

class BottomGrid extends StatefulWidget {
  BottomGrid({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _BottomGridStates createState() => _BottomGridStates();
}

class _BottomGridStates extends State<BottomGrid> {

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GridView.count(
      childAspectRatio: 2.3,
      crossAxisCount: 3,
      children: List.generate(9, (index) {
        return Container(
          padding: const EdgeInsets.all(0.5),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color:  GridButton.generateColor(index),
            ),
          ),
        );
      }),
    );
  }
}