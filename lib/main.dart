import 'package:flutter/material.dart';
import 'question.dart';
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icons> scoreKeeper=[];
  // List<String> questions=['You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'];
  // List<bool> answers=[false,true,true];

  List<Question> questionBank=[Question(q:'You can lead a cow down stairs but not up stairs.',a:false),
  Question(q:'Approximately one quarter of human bones are in the feet.',a:true),
  Question(q:'A slug\'s blood is green.',a:true),];
  int questionno=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionno].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green,),
              child: TextButton(
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  bool correctanswer=questionBank[questionno].questionanswer;
                  if(correctanswer==true){print('User got it right');}
                  else{print('User got it wrong.');}
                  setState(() {
                    if(questionno<3){questionno++;}
                    else{questionno=0;}
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.red),
              child: TextButton(
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //The user picked false.
                  setState(() {
                    if(questionno<3){questionno++;}
                    else{questionno=0;}
                  });
                },
              ),
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(children:[Icon(Icons.check,color: Colors.green,),Icon(Icons.stop,color:Colors.red)])
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
