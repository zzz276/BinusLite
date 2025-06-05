import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About(this.title, {super.key});
  final String title;
  static final List<List<String>> cofounders = [
    ["Gabriel Jovico Prathama", "Binusian 2027"],
    ["Marvello Perdana", "Binusian 2027"],
    ["Riansyah Hazmi Halomoan Abdian", "Binusian 2027"],
    ["Tobyas Nathaniel Triwira Nababan", "Binusian 2026"],
    // ["Welan Ale Zeni", "Binusian 2027"],
    ["Zeni Zuanda", "Binusian 2027"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined),
          iconSize: 60.0,
          onPressed: () => Navigator.of(context).pop()
        ),

        title: Text(title)
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "What is BinusLite?",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)
            ),

            const SizedBox(height: 8.0),
            const Text(
              "BinusLite is a mobile application which provides information about available majors in BINUS University. This app helps users find out more in-depth information about the majors, including career prospects, how much the major suits their interests, as well as being able to communicate with other users who are interested to attend in BINUS University, one of the best private universities in Indonesia.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8.0),
            const Text(
              "Co-founders",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8.0),
            Expanded(
              child: Card(
                color: const Color(0xFF6DCAF6),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              color: const Color(0xFFF2F2F2),
                              shape: BoxShape.circle
                            ),
                                    
                            height: 50.0,
                            width: 50.0,
                            child: const Icon(Icons.person, color: Color(0xFFBBBFC2), size: 40.0)
                          ),
                      
                          const SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cofounders[index][0], style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                              Text(cofounders[index][1], style: const TextStyle(fontSize: 16.0))
                            ]
                          )
                        ]
                      )
                    );
                  },
                
                  itemCount: cofounders.length
                )
              )
            )
          ]
        )
      )
    );
  }
}
