import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile(this.title, {super.key});
  final String title;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static String displayName = "Omega";
  static String username = "omg";
  static String email = "a3@aaa.aa";
  static String password = "12345678";
  final List<TextEditingController> controllers = [
    TextEditingController.fromValue(
      TextEditingValue(text: displayName)
    ),

    TextEditingController.fromValue(
      TextEditingValue(text: username)
    ),

    TextEditingController.fromValue(
      TextEditingValue(text: email)
    ),

    TextEditingController.fromValue(
      TextEditingValue(text: password)
    )
  ];

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

        title: const Text("Profile")
      ),

      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const SizedBox.square(
                      dimension: 32.0,
                      child: Icon(Icons.person)
                    ),

                    const SizedBox.square(dimension: 32.0),
                    Text("$displayName\n$username")
                  ]
                )
              )
            ),

            TextField(
              controller: controllers[0],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0)
                ),
                    
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                hintText: "Display Name ...",
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    displayName = controllers[0].text;
                  }),

                  icon: const Icon(Icons.edit)
                )
              )
            ),

            const SizedBox(height: 32.0),
            TextField(
              controller: controllers[1],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0)
                ),
                    
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                hintText: "Username ...",
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    username = controllers[1].text;
                  }),

                  icon: const Icon(Icons.edit)
                )
              )
            ),
              
            const SizedBox(height: 32.0),
            TextField(
              controller: controllers[2],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0)
                ),

                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                hintText: "Email ...",
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    email = controllers[2].text;
                  }),

                  icon: const Icon(Icons.edit)
                )
              )
            ),
              
            const SizedBox(height: 32.0),
            TextField(
              controller: controllers[3],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0)
                ),

                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                hintText: "Password ...",
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    password = controllers[3].text;
                  }),

                  icon: const Icon(Icons.edit)
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
