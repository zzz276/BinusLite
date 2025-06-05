import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String result;
  const Result(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your Result",
                style: TextStyle(fontSize: 32.0),
                textAlign: TextAlign.center
              ),
              
              const SizedBox(height: 16.0),
              Text(
                result,
                style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center
              ),

              const SizedBox(height: 64.0),
              const Text(
                "You can discuss about the result with your counselor, homeroom teacher, or parent. If you're interested to continue your study at BINUS, you can also match the result with various majors there.",
                softWrap: true,
                textAlign: TextAlign.center
              ),

              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                  Navigator.of(context).pushNamed('/navigation');
                },

                child: const SizedBox(width: double.infinity, child: Text("Back to Dashboard", textAlign: TextAlign.center))
              )
            ]
          )
        )
      )
    );
  }
}
