import 'package:flutter/material.dart';

import 'GridButton.dart';

class AddTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Text upperText = Text("How do you feel now?",
        textAlign: TextAlign.center,
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
          child: GridView.count(
            crossAxisCount: 6,
            children: List.generate(36, (index) {
              return Container(
                width: 42,
                height: 42,
                padding: const EdgeInsets.all(3.0),
                child: GridButton(index: index),
              );
            }),
          ),
        )
      ],
    );
  }
}


