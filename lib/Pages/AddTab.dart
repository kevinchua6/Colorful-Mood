import 'package:flutter/material.dart';

import 'GridButton.dart';

class AddTab extends StatelessWidget {

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
    GridView upperGrid = GridView.count(
      crossAxisCount: 6,
      children: List.generate(36, (index) {
        return Container(
          width: 1,
          height: 42,
          padding: const EdgeInsets.all(0.5),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: generateColor(index),
            ),
          ),
        );
      }),
    );

    GridView lowerGrid = GridView.count(
      childAspectRatio: 2.3,
      crossAxisCount: 3,
      children: List.generate(9, (index) {
        return Container(
          height: 10,
          width: 20,
          padding: const EdgeInsets.all(0.5),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: generateColor(index),
            ),
          ),
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

    Text lowerText = Text("I am...",
        // textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Aleo',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: Colors.blue,
        )
    );

    return Column(
      children: [
        Container(
            child: upperText,
            padding: EdgeInsets.all(20)
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.count(
              crossAxisCount: 6,
              children: List.generate(36, (index) {
                return Container(
                  width: 42,
                  height: 42,
                  padding: const EdgeInsets.all(0.5),
                  child: GridButton(index: index),
                );
              }),
            ),
          )
        ),
        Container(
          child: lowerText,
        ),
        Container(
          height: 135,
          width: 300,
          child: lowerGrid,
        ),
      ],
    );
  }}


