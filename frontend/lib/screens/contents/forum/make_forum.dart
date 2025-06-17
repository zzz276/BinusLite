import 'package:binus_lite/apis/api.dart';
import 'package:binus_lite/helpers/logged_in_user.dart';
import 'package:binus_lite/helpers/snack_bar.dart';
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

  void back(BuildContext context) {
    Navigator.of(context).pop();
    titleController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined),
          iconSize: 60.0,
          onPressed: () => back(context)
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
              onPressed: () async {
                if (titleController.text.isNotEmpty) {
                  bool isCreated = await createForum(
                    context,
                    titleController.text,
                    descriptionController.text,
                    LoggedInUser.loggedInUser!.userID
                  );

                  if (isCreated) { back(context); }
                } else { showSnackBar(context, "Question field is empty"); }
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
