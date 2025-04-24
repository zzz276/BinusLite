import 'package:binus_lite/models/major.dart';
import 'package:binus_lite/screens/contents/major/major_detail.dart';
import 'package:flutter/material.dart';

class Majors extends StatefulWidget {
  const Majors({super.key});

  @override
  State<Majors> createState() => _MajorsState();
}

class _MajorsState extends State<Majors> {
  static late String searchQuery;
  static late List<Major> searchMajor;
  List<Major> majors = [
    Major(
      name: "Mobile Application and Technology",
      region: "Kemanggisan",
      faculty: "School of Computer Science",
      foundedYear: "2010",
      overview: "Mobile Application and IoT Engineer",
      catalogueLink: "https://curriculum.binus.ac.id/files/2012/04/SOCS-Mobile-Application-Technology-2023.pdf"
    ),

    Major(
      name: "Artificial Intelligence",
      region: "Kemanggisan",
      faculty: "School of Computer Science",
      foundedYear: "2023",
      overview: "Machine Learning and Deep Learning Engineer"
    ),

    Major(
      name: "Computer Science",
      region: "Alam Sutera",
      faculty: "School of Computer Science",
      foundedYear: "1998",
      overview: "Software Engineer"
    )
  ];

  @override
  Widget build(BuildContext context) {
    majors.sort((a, b) => a.name.compareTo(b.name));
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SearchBar(
            hintText: "Search major here ...",
            keyboardType: TextInputType.text,
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });

              // searchMajor = majors.cast<Major>().;
            },
          
            trailing: const [Icon(Icons.search_rounded)],
          ),

          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF6DCAF6),
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${majors[index].name}\n@${majors[index].region}",
                              overflow: TextOverflow.clip,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start
                            )
                          ]
                        ),

                        const SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () => Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => MajorDetail(majors[index])
                                )
                              ),

                              child: const Text(
                                "Detail",
                                textAlign: TextAlign.center
                              )
                            )
                          ]
                        )
                      ]
                    )
                  )
                );
              },

              itemCount: majors.length
            )
          )
        ]
      )
    );
  }
}
