import 'package:binus_lite/screens/contents/quiz/introduction.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Take the quiz",
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 64.0,),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => Introduction())
            );
          },

          child: const Text("Take the quiz")
        )
      ],
    );
  }
}
