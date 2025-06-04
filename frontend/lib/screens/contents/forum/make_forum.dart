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
          onPressed: () => Navigator.pop(context)
        ),

        title: const Text("Forum")
      ),

      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: "Write title here ...")
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
                titleController.clear();
                descriptionController.clear();
                Navigator.of(context).pop();
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
