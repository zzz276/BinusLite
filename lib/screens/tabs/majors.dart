import 'package:binus_lite/models/major.dart';
import 'package:binus_lite/screens/contents/major/major_detail.dart';
import 'package:flutter/material.dart';

class Majors extends StatefulWidget {
  const Majors({super.key});

  @override
  State<Majors> createState() => _MajorsState();
}

class _MajorsState extends State<Majors> {
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
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(
          hintText: "Search major here ...",
          keyboardType: TextInputType.text,
          onChanged: (value) {
            setState(() {
              
            });
          },

          trailing: const [Icon(Icons.search_rounded)],
        ),

        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${majors[index].name}\n@${majors[index].region}",
                      overflow: TextOverflow.clip,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start
                    ),

                    const SizedBox(height: 64.0),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => MajorDetail(major: majors[index])
                        )
                      ),

                      child: const Text(
                        "View",
                        textAlign: TextAlign.end
                      )
                    )
                  ]
                )
              );
            },

            itemCount: majors.length
          )
        )
      ]
    );
  }
}
