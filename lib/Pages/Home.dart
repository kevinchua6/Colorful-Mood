import 'package:flutter/material.dart';
import 'package:untitled/MyHomePage.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text(
      'How are you now?',
      style: getOptionStyle(),
    );
  }
}
