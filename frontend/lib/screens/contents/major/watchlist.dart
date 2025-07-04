import 'package:binus_lite/models/major.dart';
import 'package:binus_lite/screens/contents/major/major_detail.dart';
import 'package:flutter/material.dart';

class Watchlist extends StatefulWidget {
  const Watchlist(this.majorsList, this.title, {super.key});
  final List<Major> majorsList;
  final String title;

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined),
          iconSize: 60.0,
          onPressed: () => Navigator.of(context).pop()
        ),

        title: Text(widget.title)
      ),
      
      body: Padding(
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
                              const Icon(
                                Icons.bookmark_rounded,
                                color: Color(0xFFEF8800),
                                size: 36.0
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
            )
          ]
        )
      )
    );
  }
}
