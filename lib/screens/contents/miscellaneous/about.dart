import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About(this.title, {super.key});
  final String title;
  static final List<String> names = [
      "Gabriel Jovico Prathama",
      "Marvello Perdana",
      "Riansyah Hazmi Halomoan Abdian",
      "Tobyas Nathaniel Triwira Nababan",
      // "Welan Ale Zeni",
      "Zeni Zuanda"
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined),
          onPressed: () => Navigator.pop(context)
        ),

        title: Text(title)
      ),

      body: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(
                    names[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                    )
                  ),

                  const SizedBox(height: 32.0)
                ]
              );
            },

            itemCount: names.length
          )
        )
      )
    );
  }
}
