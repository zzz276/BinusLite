import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Take the quiz",
          textAlign: TextAlign.center,
        ),

        ElevatedButton(
          onPressed: () {
            
          },

          child: const Text("Take the quiz")
        )
      ],
    );
  }
}
