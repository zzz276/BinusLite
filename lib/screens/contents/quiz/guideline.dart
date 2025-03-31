import 'package:binus_lite/screens/contents/quiz/questions.dart';
import 'package:flutter/material.dart';

class Guideline extends StatefulWidget {
  const Guideline({super.key});

  @override
  State<Guideline> createState() => _GuidelineState();
}

class _GuidelineState extends State<Guideline> {
  bool isReady = false;

  startQuiz(BuildContext context) {
    if (!isReady) return;
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => const Questions()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined),
          iconSize: 60.0,
          onPressed: () => Navigator.pop(context),
        ),

        title: const Text("Quiz")
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Guideline",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold
              )
            ),

            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) => setState(() => isReady = value!),
              title: const Text("I have read the guideline."),
              value: isReady
            ),
        
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () => startQuiz(context),
              child: const SizedBox(
                width: double.infinity,
                child: Text(
                  "Start the quiz",
                  textAlign: TextAlign.center
                )
              )
            )
          ]
        )
      )
    );
  }
}
