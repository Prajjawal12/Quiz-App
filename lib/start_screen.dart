import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/quiz-logo.png',
            width: 350,
            height: 350,
            color: const Color.fromARGB(111, 255, 255, 255),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          'Learn Flutter the fun way!',
          style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 233, 211, 240),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 50),
        ElevatedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          icon: const Icon(Icons.arrow_right_alt_sharp,
              color: Color.fromARGB(255, 180, 145, 240)),
          label: const Text(
            'Start Quiz',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
