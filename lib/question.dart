import 'package:flutter/cupertino.dart';

class Question extends StatelessWidget {
  String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
