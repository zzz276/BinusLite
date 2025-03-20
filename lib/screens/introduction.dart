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
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
        title: const Text('Introduction'),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'This introduction explains the outline of the course.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),

                  textAlign: TextAlign.start,
                ),

                const SizedBox(height: 16.0),
                const Text(
                  'Course Outline:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),

                  textAlign: TextAlign.start,
                ),

                const SizedBox(height: 16.0),
                const Text(
                  'Coming Soon',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                  ),

                  textAlign: TextAlign.start,
                ),

                const SizedBox(height: 32.0),
                const Text(
                  'Prerequisites: None',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),

                  textAlign: TextAlign.start,
                ),

                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  child: const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Back',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
