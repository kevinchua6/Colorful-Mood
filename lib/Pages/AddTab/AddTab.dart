import 'package:flutter/material.dart';

import 'BottomGrid.dart';
import 'GridButton.dart';

class AddTab extends StatelessWidget {
  final List<int> lists = [];

  @override
  Widget build(BuildContext context) {
    GridView upperGrid = GridView.count(
      crossAxisCount: 6,
      children: List.generate(36, (index) {
        return Container(
          padding: const EdgeInsets.all(0.5),
          child: GridButton(index: index, lists: lists),
        );
      }),
    );


    Text upperText = Text("How do you feel now?",
        style: TextStyle(
          fontFamily: 'Aleo',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: Colors.blue,
        )
    );

    Text lowerText = Text("I am feeling...",
        // textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Aleo',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: Colors.blue,
        )
    );

    BottomGrid bottomGrid = BottomGrid(index: lists.length <= 0 ? 1 : lists[lists.length-1], lists: lists);

    return Column(
      children: [
        Container(
            child: upperText,
            padding: EdgeInsets.all(20)
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: upperGrid
          )
        ),
        // Container(
        //   child: lowerText,
        // ),
        // Container(
        //   height: 135,
        //   width: 300,
        //   child: bottomGrid,
        // ),
      ],
    );
  }}
