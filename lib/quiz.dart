import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
    {required this.questions, 
    required this.answerQuestion, 
    required this.questionIndex});
  
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
            
        //map method executes the function passed in the argument on every element of the list questions.
        //the three dots take the values from the list and adds them to the surrounding list (i.e. children) as individual elements.
        //toList() is basically creating a new list of the elements returned after mapping the original list.
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}


