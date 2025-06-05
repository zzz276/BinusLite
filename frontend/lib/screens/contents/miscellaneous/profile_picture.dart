import 'package:binus_lite/helpers/logged_in_user.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture(this.title, {super.key});
  final String title;

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  final List<String> pictures = ["lib/assets/pictures/user profile 1.png", "lib/assets/pictures/user profile 2.png"];

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

      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (LoggedInUser.loggedInUser?.picture == null) ? 
            const CircleAvatar(
              backgroundColor: Color(0xFFF2F2F2),
              radius: 128.0,
              child: Icon(Icons.person, color: Color(0xFFBBBFC2), size: 216.0)
            ) : 
            CircleAvatar(
              backgroundImage: AssetImage((LoggedInUser.loggedInUser?.picture)!),
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
                    CircleAvatar(
                      backgroundImage: AssetImage(pictures[0]),
                      radius: 36.0,
                      child: ElevatedButton(
                        onPressed: () => setState(() => LoggedInUser.loggedInUser?.picture = pictures[0]),
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Color(0x00000000)),
                          elevation: WidgetStatePropertyAll(100.0)
                        ),

                        child: null
                      )
                    ),

                    const SizedBox(width: 16.0),
                    CircleAvatar(
                      backgroundImage: AssetImage(pictures[1]),
                      radius: 36.0,
                      child: ElevatedButton(
                        onPressed: () => setState(() => LoggedInUser.loggedInUser?.picture = pictures[1]),
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Color(0x00000000)),
                          elevation: WidgetStatePropertyAll(100.0)
                        ),

                        child: null
                      )
                    ),

                    const SizedBox(width: 16.0),
                    CircleAvatar(
                      backgroundColor: const Color(0xFFF2F2F2),
                      radius: 36.0,
                      child: IconButton(
                        icon: const Icon(Icons.add_rounded, color: Color(0xFF000000), size: 60.0),
                        onPressed: () => setState(() => LoggedInUser.loggedInUser?.picture = null),
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Color(0x00000000)),
                          elevation: WidgetStatePropertyAll(100.0)
                        )
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
