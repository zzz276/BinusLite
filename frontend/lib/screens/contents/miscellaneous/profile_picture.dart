import 'package:flutter/material.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {

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

        title: Text("Forum")
      ),

      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [

          ]
        )
      )
    );
  }
}