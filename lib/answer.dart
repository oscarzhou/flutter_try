import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final Function pressedHandler;

  Answer(this.answer, this.pressedHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(
          child: Text(answer),
          onPressed: pressedHandler,
        ));
  }
}
