import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text("Question 1"),
              const Text("Question 2"),
              const Text("Question 3"),
              const Text("Question 4"),
              const Text("Question 5"),
              const Text("Question 6"),
              const Text("Question 7"),
              const Text("Question 8"),
              const Text("Question 9"),
              const Text("Question 10"),
              ElevatedButton(
                onPressed: () {
                  
                },

                child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Submit",
                    textAlign: TextAlign.center
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}