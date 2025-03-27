import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This introduction explains the outline of the course.',
              textAlign: TextAlign.start,
            ),
        
            const SizedBox(height: 16.0),
            const Text(
              'Course Outline:',
              textAlign: TextAlign.start,
            ),
        
            const SizedBox(height: 16.0),
            const Text(
              'Coming Soon',
              textAlign: TextAlign.start,
            ),
        
            const SizedBox(height: 32.0),
            const Text(
              'Prerequisites: None',
              textAlign: TextAlign.start,
            ),
        
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const SizedBox(
                width: double.infinity,
                child: Text(
                  'Start the quiz',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
