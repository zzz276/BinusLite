import 'dart:math';
import 'package:binus_lite/models/forum_post.dart';
import 'package:flutter/material.dart';

class Forum extends StatefulWidget {
  const Forum({super.key});

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  final List<ForumPost> posts = [
    ForumPost(question: "Is Mobile Application and Technology a good major?"),
    ForumPost(
      question: "What are the reasons behind the students to enroll in Psychology?",
      voteCount: 2
    )
  ];

  final TextEditingController searchController = TextEditingController();
  static late List<ForumPost> searchPost;

  void querySearch(String q) {
    setState(() {
      searchPost = posts.where((post) => 
      post.question.toLowerCase().contains(q.toLowerCase())).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    searchPost = posts;
  }

  @override
  Widget build(BuildContext context) {
    searchPost.sort((a, b) => max(a.voteCount, b.voteCount));
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SearchBar(
            controller: searchController,
            hintText: "Ask any questions here ...",
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
              itemCount: searchPost.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF018ED5),
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Table(
                          columnWidths: const {0: FlexColumnWidth(), 1: FixedColumnWidth(30.0)},
                          children: [
                            TableRow(
                              children: [
                                Text(
                                  searchPost[index].question,
                                  style: const TextStyle(color: Color(0xFFFFFFFF)),
                                  textAlign: TextAlign.start
                                ),

                                // IconButton(
                                //   onPressed: () {
                                    
                                //   },

                                //   icon: const Icon(Icons.more_vert_rounded, color: Color(0xFFFFFFFF))
                                // )
                              ]
                            )
                          ]
                        ),
                        
                        const SizedBox(height: 32.0),
                        SizedBox(
                          child: Card(
                            color: const Color(0xFFEF8800),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => setState(() => searchPost[index].voteCount++),
                                  icon: const Icon(Icons.arrow_upward_outlined, color: Color(0xFFFFFFFF))
                                ),
                                
                                Text(
                                  searchPost[index].voteCount.toString(),
                                  style: const TextStyle(color: Color(0xFFFFFFFF))
                                ),
                          
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      (searchPost[index].voteCount > 0) ? searchPost[index].voteCount-- : 0;
                                    });
                                  },

                                  icon: const Icon(Icons.arrow_downward_outlined, color: Color(0xFFFFFFFF))
                                )
                              ]
                            )
                          )
                        )
                      ]
                    )
                  )
                );
              }
            )
          )
        ]
      )
    );
  }
}
