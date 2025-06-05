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
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Questions()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined),
          iconSize: 60.0,
          onPressed: () => Navigator.of(context).pop()
        ),

        title: const Text("Guideline")
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Introduction", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            const Text("This quiz is designed to help you to know more of your interest, potential, and personal talent tendencies, which would determine the right major in BINUS University or any other universities."),
            const SizedBox(height: 16.0),
            const Text("Purpose",style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            const Text("This quiz helps you evaluate your interest in various study fields."),
            const Text("This quiz finds out appropriate activities, subjects, and professions based on your personalities and talents."),
            const Text("This quiz gives you major preview which could help you make better decision."),
            const SizedBox(height: 16.0),
            const Text("Instruction", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            const Text("Answer each question honestly!"),
            const Text("There's no right or wrong answer. The answers reflect your uniqueness."),
            const Text("There are a few scale-scoring questions, multiple choices questions, and an open ended question at the end of the quiz."),
            const Text("Read the question carefully before answering!"),
            const Text("Use your time wisely!\nThis quiz could be done in 10~15 minutes."),
            const SizedBox(height: 16.0),
            CheckboxListTile(
              activeColor: const Color(0xFFEF8800),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) => setState(() => isReady = value!),
              title: const Text("I have read the guideline."),
              value: isReady
            ),
        
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => startQuiz(context),
              style: (isReady) ? 
              const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xFFEF8800)),
                foregroundColor: WidgetStatePropertyAll(Color(0xFFFFFFFF))
              ) : 
              const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xFFFFD2B4)),
                foregroundColor: WidgetStatePropertyAll(Color(0xB4FFFFFF))
              ),

              child: const SizedBox(width: double.infinity, child: Text("Start the quiz", textAlign: TextAlign.center))
            )
          ]
        )
      )
    );
  }
}
