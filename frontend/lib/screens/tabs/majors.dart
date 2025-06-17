import 'package:binus_lite/apis/api.dart';
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
  late Future<List<Major>?> fetchMajors;
  late List<Major> majorsList;
  late List<Major> searchMajor;

  void querySearch(String q) {
    setState(() {
      searchMajor = majorsList.where((major) => 
      major.name.toLowerCase().contains(q.toLowerCase())).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchMajors = allMajor(context);
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
          FutureBuilder(
            builder: (context, snapshot) {
              var data = snapshot.data;

              if (data == null) { return const Center(child: Column(children: [CircularProgressIndicator(), Text("Loading.")])); }
              else {
                if (data.isEmpty) { return const Center(child: Text("No data.")); }
                else {
                  majorsList = data;
                  searchMajor = majorsList;

                  return Expanded(
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
                                      overflow: TextOverflow.visible,
                                      softWrap: true,
                                      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start
                                    )
                                  ]
                                ),

                                const SizedBox(height: 16.0),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => setState(() => searchMajor[index].isWatched = (searchMajor[index].isWatched == false) ? true : false),
                                      child: Icon(
                                        Icons.bookmark_rounded,
                                        color: (searchMajor[index].isWatched == false) ? 
                                        const Color(0xFFFFFFFF) : 
                                        const Color(0xFFEF8800),
                                        size: 36.0
                                      )
                                    ),

                                    const SizedBox(width: 160.0),
                                    ElevatedButton(
                                      onPressed: () => Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => MajorDetail(searchMajor[index]))
                                      ),

                                      child: const Text(
                                        "Detail",
                                        style: TextStyle(fontSize: 16.0),
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

                      itemCount: searchMajor.length
                    )
                  );
                }
              }
            },

            future: fetchMajors
          ),
        ]
      )
    );
  }
}
