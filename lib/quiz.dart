import 'package:flutter/widgets.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Question(questions[questionIndex]["questionText"]),
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(answer, answerQuestion);
        }).toList()
      ]),
    );
  }
}
