import 'package:binus_lite/models/forum_post.dart';
import 'package:flutter/material.dart';

class Forum extends StatefulWidget {
  const Forum({super.key});

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  List<ForumPost> posts = [
    ForumPost(question: "Is Mobile Application and Technology a good major?")
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SearchBar(
            hintText: "Ask any questions here ...",
            keyboardType: TextInputType.text,
            onChanged: (value) {
              setState(() {
                  
              });
            },
            
            trailing: const [Icon(Icons.search_rounded)],
          ),

          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF018ED5),
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts[index].question,
                          style: const TextStyle(color: Color(0xFFFFFFFF)),
                          textAlign: TextAlign.start
                        ),
                        
                        const SizedBox(height: 16.0),
                        Card(
                          color: const Color(0xFFEF8800),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  
                                },
      
                                icon: const Icon(
                                  Icons.arrow_upward_outlined,
                                  color: Color(0xFFFFFFFF)
                                )
                              ),
      
                              Text(
                                posts[index].replies.toString(),
                                style: const TextStyle(color: Color(0xFFFFFFFF))
                              ),

                              IconButton(
                                onPressed: () {
                                  
                                },
      
                                icon: const Icon(
                                  Icons.arrow_downward_outlined,
                                  color: Color(0xFFFFFFFF)
                                )
                              )
                            ]
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
