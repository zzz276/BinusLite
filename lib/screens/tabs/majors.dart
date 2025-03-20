import 'package:binus_lite/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class Majors extends StatefulWidget {
  const Majors({super.key});

  @override
  State<Majors> createState() => _MajorsState();
}

class _MajorsState extends State<Majors> {
  final List<String> subjects = ['MAT'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Search"),
        Expanded(
          child: ListView.builder(
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 50.0,),
                    Text(
                      subjects[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),

                      textAlign: TextAlign.start,
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(title: subjects[index])
                          ),
                        );
                      },

                      child: const Text(
                        'View',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
