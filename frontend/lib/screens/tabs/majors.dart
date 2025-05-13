import 'package:binus_lite/models/major.dart';
import 'package:binus_lite/screens/contents/major/major_detail.dart';
import 'package:flutter/material.dart';

class Majors extends StatefulWidget {
  const Majors({super.key});

  @override
  State<Majors> createState() => _MajorsState();
}

class _MajorsState extends State<Majors> {
  final List<Major> majors = [
    Major(
      name: "Mobile Application and Technology",
      region: "Kemanggisan",
      faculty: "School of Computer Science",
      foundedYear: 2010,
      duration: 4,
      title: "S. Kom.",
      overview: "Mobile Application and IoT Engineer",
      career: "Mobile Engineer",
      catalogueLink: "https://curriculum.binus.ac.id/files/2012/04/SOCS-Mobile-Application-Technology-2023.pdf"
    ),

    Major(
      name: "Artificial Intelligence",
      region: "Kemanggisan",
      faculty: "School of Computer Science",
      foundedYear: 2023,
      duration: 4,
      title: "S. Kom.",
      overview: "Machine Learning, Deep Learning, Natural Language Processing",
      career: "Machine Learning and Deep Learning Engineer"
    ),

    Major(
      name: "Computer Science",
      region: "Alam Sutera",
      faculty: "School of Computer Science",
      foundedYear: 1987,
      duration: 4,
      title: "S. Kom.",
      overview: "Software Engineer",
      career: "Developer, IT Consultant"
    )
  ];

  final TextEditingController searchController = TextEditingController();
  late List<Major> searchMajor;

  void querySearch(String q) {
    setState(() {
      searchMajor = majors.where((major) =>
      major.name.toLowerCase().startsWith(q.toLowerCase())).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchMajor = majors;
  }

  @override
  Widget build(BuildContext context) {
    searchMajor.sort((a, b) => a.name.compareTo(b.name));
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SearchBar(
            controller: searchController,
            hintText: "Search major here ...",
            keyboardType: TextInputType.text,
            onChanged: querySearch,
            trailing: [
              IconButton(
                onPressed: () {
                  searchController.clear();
                  querySearch("");
                },
      
                icon: const Icon(Icons.close_rounded)
              )
            ]
          ),
      
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF6DCAF6),
                  margin: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: const BorderSide(color: Color(0xFF7E3586), width: 1.0)
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${searchMajor[index].name}\n@${searchMajor[index].region}",
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
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MajorDetail(searchMajor[index])
                                )
                              ),
      
                              child: const Text("Detail", textAlign: TextAlign.center)
                            )
                          ]
                        )
                      ]
                    )
                  )
                );
              },
      
              itemCount: searchMajor.length
            )
          )
        ]
      ),
    );
  }
}
