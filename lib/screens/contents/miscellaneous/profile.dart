import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      'Gabriel Jovico Prathama',
      'Marvello Perdana',
      'Riansyah Hazmi Halomoan Abdian',
      'Tobyas Nathaniel Triwira Nababan',
      // 'Welan Ale Zeni',
      'Zeni Zuanda'
    ];

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text('Credits'),
      ),

      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(
                    names[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.0
                    ),
                  ),

                  const SizedBox(height: 32.0,)
                ],
              );
            }
          ),
        ),
      )
    );
  }
}
