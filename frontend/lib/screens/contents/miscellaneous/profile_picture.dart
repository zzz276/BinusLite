import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfilePicture extends StatefulWidget {
  ProfilePicture(this.title, this.picture, {super.key});
  final String title;
  String? picture;

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  final List<String?> pictures = ["lib/assets/pictures/user profile 1.png", "lib/assets/pictures/user profile 2.png", null];
  String? picture;

  @override
  void initState() {
    super.initState();
    picture = widget.picture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined),
          iconSize: 60.0,
          onPressed: () => Navigator.of(context).pop(picture)
        ),

        title: Text(widget.title)
      ),

      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (picture == null) ? 
            const CircleAvatar(
              backgroundColor: Color(0xFFF2F2F2),
              radius: 128.0,
              child: Icon(Icons.person, color: Color(0xFFBBBFC2), size: 216.0)
            ) : 
            CircleAvatar(
              backgroundImage: AssetImage(picture!),
              radius: 128.0
            ),

            const SizedBox(height: 64.0),
            const Text(
              "Choose your profile picture!",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center
            ),

            const SizedBox(height: 16.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: const BorderSide(color: Color(0xFFEF8800), width: 1.0)
              ),

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => picture = pictures[0]),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(pictures[0]!),
                        radius: 36.0
                      )
                    ),

                    const SizedBox(width: 16.0),
                    GestureDetector(
                      onTap: () => setState(() => picture = pictures[1]),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(pictures[1]!),
                        radius: 36.0
                      )
                    ),

                    const SizedBox(width: 16.0),
                    GestureDetector(
                      onTap: () => setState(() => picture = null),
                      child: const CircleAvatar(
                        backgroundColor: Color(0xFFF2F2F2),
                        radius: 36.0
                      )
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
}
