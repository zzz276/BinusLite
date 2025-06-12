import 'package:binus_lite/models/forum_post.dart';
import 'package:flutter/material.dart';

class Forum extends StatefulWidget {
  const Forum(this.title, this.postsList, {super.key});
  final String title;
  final List<ForumPost> postsList;

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  final TextEditingController searchController = TextEditingController();
  static late List<ForumPost> searchPost;

  void querySearch(String q) {
    setState(() {
      searchPost = widget.postsList.where((post) => 
      post.question.toLowerCase().contains(q.toLowerCase())).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    searchPost = widget.postsList;
  }

  @override
  Widget build(BuildContext context) {
    searchPost.sort((a, b) => b.voteCount.compareTo(a.voteCount));
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
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {/* Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForumReplies())) */},
                  child: Card(
                    color: const Color(0xFF018ED5),
                    margin: const EdgeInsets.all(16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                searchPost[index].username,
                                style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 24.0, fontWeight: FontWeight.bold),
                              ),

                              const SizedBox(height: 16.0),
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: const Color(0xFFEF8800)),
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                width: 96.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () => setState(() => searchPost[index].voteCount++),
                                      child: const Icon(Icons.arrow_upward_outlined, color: Color(0xFFFFFFFF))
                                    ),
                                    
                                    Text(
                                      searchPost[index].voteCount.toString(),
                                      style: const TextStyle(color: Color(0xFFFFFFFF))
                                    ),
                              
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          (searchPost[index].voteCount > 0) ? searchPost[index].voteCount-- : 0;
                                        });
                                      },
                                          
                                      child: const Icon(Icons.arrow_downward_outlined, color: Color(0xFFFFFFFF))
                                    )
                                  ]
                                )
                              )
                            ]
                          ),

                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Text(
                              searchPost[index].question,
                              overflow: TextOverflow.visible,
                              style: const TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              ),

                              softWrap: true,
                              textAlign: TextAlign.start
                            )
                          )
                        ]
                      )
                    )
                  )
                );
              },

              itemCount: searchPost.length
            )
          )
        ]
      )
    );
  }
}
