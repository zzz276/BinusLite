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
          "Have you found your desired major?\nLet's find out here!",
          style: TextStyle(fontSize: 24.0),
          textAlign: TextAlign.center
        ),

        const SizedBox(height: 64.0),
        ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Guideline()
            )
          ),

          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Take the quiz",
              style: TextStyle(fontSize: 24.0),
            ),
          )
        )
      ]
    );
  }
}
