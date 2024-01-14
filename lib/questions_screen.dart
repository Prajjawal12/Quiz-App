import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void changeQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    print("Changing Question");
    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
    });

    //currentQuestionIndex += 1
    //currentQuestionIndex++
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 188, 156, 219),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map(
              (e) {
                return AnswerButton(e, () {
                  changeQuestion(e);
                });
              },
            ),
            // AnswerButton(
            //   currentQuestion.answers[0],
            //   () {},
            // ),
            // AnswerButton(
            //   currentQuestion.answers[1],
            //   () {},
            // ),
            // AnswerButton(
            //   currentQuestion.answers[2],
            //   () {},
            // ),
            // AnswerButton(
            //   currentQuestion.answers[3],
            //   () {},
            // )
          ],
        ),
      ),
    );
  }
}
