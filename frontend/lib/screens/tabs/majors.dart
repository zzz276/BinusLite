import 'package:binus_lite/models/major.dart';
import 'package:binus_lite/screens/contents/major/major_detail.dart';
import 'package:flutter/material.dart';

class Majors extends StatefulWidget {
  const Majors(this.majorsList, {super.key});
  final List<Major> majorsList;

  @override
  State<Majors> createState() => _MajorsState();
}

class _MajorsState extends State<Majors> {
  final TextEditingController searchController = TextEditingController();
  late List<Major> searchMajor;

  void querySearch(String q) {
    setState(() {
      searchMajor = widget.majorsList.where((major) => 
      major.name.toLowerCase().contains(q.toLowerCase())).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    searchMajor = widget.majorsList;
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
            trailing: (searchController.text.isEmpty) ? null : [
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
                              searchMajor[index].name,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start
                            )
                          ]
                        ),
      
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => setState(() => searchMajor[index].isWatched = true),
                              icon: const Icon(Icons.bookmark_rounded)
                            ),

                            const SizedBox(width: double.infinity),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => MajorDetail(searchMajor[index]))
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
      )
    );
  }
}
