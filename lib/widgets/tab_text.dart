import 'package:flutter/material.dart';

class TabText extends StatelessWidget {
  const TabText({Key? key, required this.screenSize, this.text}) : super(key: key);
  final Size screenSize;
  final text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.white,
    fontSize: 0.02 * screenSize.height),);
  }
}
