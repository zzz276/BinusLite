import 'package:binus_lite/helpers/logged_in_user.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile(this.title, {super.key});
  final String title;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static String displayName = (LoggedInUser.loggedInUser?.displayName)!;
  static String username = (LoggedInUser.loggedInUser?.username)!;
  static String email = (LoggedInUser.loggedInUser?.email)!;
  static String password = (LoggedInUser.loggedInUser?.password)!;
  final List<TextEditingController> controllers = [
    TextEditingController.fromValue(TextEditingValue(text: displayName)),
    TextEditingController.fromValue(TextEditingValue(text: username)),
    TextEditingController.fromValue(TextEditingValue(text: email)),
    TextEditingController.fromValue(TextEditingValue(text: password))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    displayName = (LoggedInUser.loggedInUser?.displayName)!;
    username = (LoggedInUser.loggedInUser?.username)!;
    email = (LoggedInUser.loggedInUser?.email)!;
    password = (LoggedInUser.loggedInUser?.password)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined),
          iconSize: 60.0,
          onPressed: () => Navigator.pop(context)
        ),

        title: Text(widget.title)
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: const BorderSide(color: Color(0xFFEF8800), width: 1.0)
              ),

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: const Color(0xFFF2F2F2),
                        shape: BoxShape.circle
                      ),

                      height: 80.0,
                      width: 80.0,
                      child: const Icon(
                        Icons.person,
                        color: Color(0xFFBBBFC2),
                        size: 60.0
                      )
                    ),

                    const SizedBox(width: 16.0),
                    Text(
                      "$displayName\n$username",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 20.0),
                    )
                  ]
                )
              )
            ),

            const SizedBox(height: 32.0),
            const Text("Display Name"),
            const SizedBox(height: 8.0),
            TextField(
              controller: controllers[0],
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: Color(0xFF018ED5))
                ),

                hintText: "Display Name ...",
                suffixIcon: IconButton(
                  onPressed: () => setState(() => LoggedInUser.loggedInUser?.displayName = controllers[0].text),
                  icon: const Icon(Icons.edit_rounded, color: Color(0xFFEF8800))
                )
              )
            ),

            const SizedBox(height: 32.0),
            const Text("Username"),
            const SizedBox(height: 8.0),
            TextField(
              controller: controllers[1],
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: Color(0xFF018ED5))
                ),

                hintText: "Username ...",
                suffixIcon: IconButton(
                  onPressed: () => setState(() => LoggedInUser.loggedInUser?.username = controllers[1].text),
                  icon: const Icon(Icons.edit_rounded, color: Color(0xFFEF8800))
                )
              )
            ),
              
            const SizedBox(height: 32.0),
            const Text("E-mail"),
            const SizedBox(height: 8.0),
            TextField(
              controller: controllers[2],
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: Color(0xFF018ED5))
                ),

                hintText: "Email ...",
                suffixIcon: IconButton(
                  onPressed: () => setState(() => LoggedInUser.loggedInUser?.email = controllers[2].text),
                  icon: const Icon(Icons.edit_rounded, color: Color(0xFFEF8800))
                )
              )
            ),
              
            const SizedBox(height: 32.0),
            const Text("Password"),
            const SizedBox(height: 8.0),
            TextField(
              controller: controllers[3],
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: Color(0xFF018ED5))
                ),

                hintText: "Password ...",
                suffixIcon: IconButton(
                  onPressed: () => setState(() => LoggedInUser.loggedInUser?.password = controllers[3].text),
                  icon: const Icon(Icons.edit_rounded, color: Color(0xFFEF8800))
                )
              ),
              
              obscureText: true
            )
          ]
        )
      )
    );
  }
}
