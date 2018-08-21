import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final String text;

  PlaceholderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(text, style: TextStyle(fontSize: 32.0),),
      ),
    );
  }
}