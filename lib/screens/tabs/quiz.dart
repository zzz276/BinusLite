import 'package:binus_lite/screens/contents/quiz/guideline.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Have you found your desired major?\nLet's find out!",
          textAlign: TextAlign.center
        ),

        const SizedBox(height: 64.0),
        ElevatedButton(
          onPressed: () => Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => const Guideline()
            )
          ),

          child: const Text("Take the quiz")
        )
      ]
    );
  }
}
