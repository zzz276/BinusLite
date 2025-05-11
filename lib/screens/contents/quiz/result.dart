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
              
              Text(
                result,
                style: const TextStyle(fontSize: 32.0),
                textAlign: TextAlign.center
              ),

              const SizedBox(height: 64.0),
              const Text(
                "You can discuss about the result with your counselor, homeroom teacher, or parent. If you're interested in  your study in , you can also",
                softWrap: true,
              ),

              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/navigation')),
                child: const SizedBox(
                  width: double.infinity,
                  child: Text("Back to Dashboard", textAlign: TextAlign.center)
                )
              )
            ]
          )
        )
      )
    );
  }
}
