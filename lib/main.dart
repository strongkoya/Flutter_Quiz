/*
A sample application made in Flutter with the help of Flutter Crash Course by Academind.
This application is a simple quiz application that would provide results at the end.
The purpose of this code is to gain a better understanding of how Flutter and Dart work and exploring the different widgets available in Dart.
*/

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './quiz.dart';
import './result.dart';

//Syntax for methods with only one line of code.
void main() => runApp(MyApp());

/*
void main() {
  runApp(MyApp()); //calls the constructor of MyApp and triggers the build method to run the application. Located in flutter/material package.
}
*/

//every widget either extends Stateful or Stateless classes for widgets
class MyApp extends StatefulWidget {
  
  @override 
  State<StatefulWidget> createState() {
    //TODO: implement createState
    return _MyAppState();
  }
}


//Using _ makes the default class to private class. 
class _MyAppState extends State<MyApp> { 
  var _questionIndex = 0;
  var _totalScore = 0;

  //Uses a list of maps - data structure with key-value pairs to store data. A list is used for storing the values of answers.
    static const _questions =  [
      {
        'questionText': 'What is your favourite color?', 
        'answers': [
          {'text': 'Black', 'score': 10}, 
          {'text': 'Red', 'score': 5}, 
          {'text': 'Blue', 'score': 3}, 
          {'text': 'White', 'score': 1}
        ],
      }, 
      {
        'questionText': 'What is your favourite animal?',
        'answers': [{'text': 'Rabbit', 'score': 3}, 
          {'text': 'Dog', 'score': 5}, 
          {'text': 'Cat', 'score': 7}, 
          {'text': 'Parrot', 'score': 1}
        ],
      },
      {
        'questionText': 'What is your favourite food?',
        'answers': [{'text': 'Burger', 'score': 9}, 
          {'text': 'Pizza', 'score': 5}, 
          {'text': 'Noodles', 'score': 3}, 
          {'text': 'Pasta', 'score': 1}
        ],
      },
    ];

  void _resetQuiz() {
    //setState triggers the build method which rerenders the UI and rebuilds the widget tree.
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if(_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print('No more questions!');
    }
  }

  //Overrides the default build method provided by Stateless Widget. build method is necessary as flutter calls this method to draw on the screen. Always returns a widget
  @override 
  Widget build(BuildContext context) { 
    //invokes the constructor of the MaterialApp class that is required for Widget building.  
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Sample'),
        ),
        body: _questionIndex < _questions.length 
          ? 
             Quiz(
               answerQuestion: _answerQuestion, 
               questionIndex: _questionIndex, 
               questions: _questions,
              )
          : 
            Result(_totalScore, _resetQuiz)
      ),
    ); 
  }
} 
