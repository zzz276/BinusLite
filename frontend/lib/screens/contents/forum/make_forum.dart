import 'package:binus_lite/helpers/logged_in_user.dart';
import 'package:binus_lite/models/forum_post.dart';
import 'package:flutter/material.dart';

class MakeForum extends StatefulWidget {
  const MakeForum(this.title, {super.key});
  final String title;

  @override
  State<MakeForum> createState() => _MakeForumState();
}

class _MakeForumState extends State<MakeForum> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: "Write title here ..."),
              maxLines: 10
            ),

            const SizedBox(height: 32.0),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: "Write description here ..."),
              maxLines: 10
            ),
        
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  Navigator.of(context).pop(ForumPost(
                    postID: 0,
                    question: titleController.text,
                    description: descriptionController.text,
                    userID: (LoggedInUser.loggedInUser?.userID)!,
                    voteCount: 0
                  ));

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Your forum has been posted successfully."))
                  );
                  
                  titleController.clear();
                  descriptionController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill the description field!"))
                  );
                }
              },

              child: const SizedBox(
                width: double.infinity,
                child: Text(
                  "Submit",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center
                )
              )
            )
          ]
        )
      )
    );
  }
}
