import 'package:flutter/material.dart';

class Forum extends StatefulWidget {
  const Forum({super.key});

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  List<String> subjects = ['MAT'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        // Navigator.push(
                        //   context, 
                        //   MaterialPageRoute(
                        //     builder: (context) => ProductDetailsScreen(title: subjects[index])
                        //   ),
                        // );
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
