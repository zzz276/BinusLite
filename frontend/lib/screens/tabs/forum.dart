import 'package:binus_lite/apis/api.dart';
import 'package:binus_lite/models/forum_post.dart';
import 'package:flutter/material.dart';

class Forum extends StatefulWidget {
  const Forum(this.title, {super.key});
  final String title;

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  final ones = [1, -1];
  final TextEditingController searchController = TextEditingController();
  late Future<List<ForumPost>?> fetchPosts;
  late List<ForumPost> postsList;
  late List<ForumPost> searchPost;

  void querySearch(String q) {
    setState(() {
      searchPost = postsList.where((post) => 
      post.question.toLowerCase().contains(q.toLowerCase())).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPosts = allForum(context);
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
          FutureBuilder(
            builder: (context, snapshot) {
              var data = snapshot.data;

              if (data == null) { return const Center(child: Column(children: [CircularProgressIndicator(), Text("Loading.")])); }
              else {
                if (data.isEmpty) { return const Center(child: Text("No data.")); }
                else {
                  postsList = data;
                  searchPost = postsList;

                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
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
                                            onTap: () async {
                                              bool isVoted = await vote(context, searchPost[index].postID, ones[0]);

                                              if (isVoted) { setState(() => searchPost[index].voteCount++); }
                                            },

                                            child: const Icon(Icons.arrow_upward_outlined, color: Color(0xFFFFFFFF))
                                          ),

                                          Text(
                                            searchPost[index].voteCount.toString(),
                                            style: const TextStyle(color: Color(0xFFFFFFFF))
                                          ),
                              
                                          GestureDetector(
                                            onTap: () async {
                                              bool isVoted = await vote(context, searchPost[index].postID, ones[1]);

                                              if (isVoted) { setState(() => searchPost[index].voteCount--); }
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
                        );
                      },

                      itemCount: searchPost.length
                    )
                  );
                }
              }
            },

            future: fetchPosts
          )
        ]
      )
    );
  }
}
