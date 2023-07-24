import 'package:flutter/material.dart';

import 'package:qizo_quizzapp/questinmod.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 247, 249),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "Qizo Quiz App",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          _questionWidget(),
          _answerList(),
          _nextButton(),
        ]),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 120, 142, 194),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shadowColor: Color.fromARGB(239, 146, 135, 184),
          elevation: 3,
          shape: const StadiumBorder(),
          foregroundColor: isSelected ? Color.fromARGB(255, 19, 20, 23) : Color(0xffffffff),
          backgroundColor: isSelected ? Colors.white :  Color.fromARGB(255, 120, 142, 194),
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastQuestion ? "Submit" : "Next"),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          if (isLastQuestion) {
            

            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
      ),
    );
  }

  _showScoreDialog() {
    bool isPassed = false;
    

    if (score >= questionList.length * 0.6) {
      
      isPassed = true;
    }
    String title = isPassed ? "Passed " : "Failed";

    return Padding(
      padding: const EdgeInsets.only(bottom: 50,top: 45,left: 10,right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        color: isPassed? Colors.green:Colors.red,


        ),
        child:Column(children: [

          Text(title,style: TextStyle(color: Colors.white),),
          Padding(
            padding: const EdgeInsets.only(top: 74),
            child: Container(
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight:Radius.circular(20),
                topLeft:Radius.circular(20),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
              )

              ),
              height: 520,
              width: 330,
              child: Padding(
                padding: const EdgeInsets.only(top:150),
                child: Column(
                  children: [
                       Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                             color: isPassed? Colors.green:Colors.red,
                          ),
                         boxShadow: [
                                            BoxShadow(
                                                color: Color(0xff737373),
                                                offset: Offset(0, 0),
                                                blurRadius: 1.5,
                                                spreadRadius: 0)
                                          ],



                        ),
                        height: 100,
                        width: 150,
                         child: Center(
                           child: Text(
                                          "  Score is $score",
                                         style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent,fontSize: 10),
                              ),
                         ),
                       ),
                          SizedBox(height: 200,),
                           ElevatedButton(
                child: const Text("Restart"),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    currentQuestionIndex = 0;
                    score = 0;
                    selectedAnswer = null;
                  });
                },
                          ),
                        
                  ],
                ),
              ),
            ),
          )
        

        ],)
        
        ),
      );
  
  }
}