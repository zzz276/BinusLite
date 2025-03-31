import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile(this.title, {super.key});
  final String title;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined),
          iconSize: 60.0,
          onPressed: () => Navigator.pop(context),
        ),

        title: Text("Profile"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text("Display Name"),
                    Text("Username")
                  ],
                )
              ),
            ),

            TextField(
              controller: displayNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0)
                ),
                    
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                labelText: "Display Name ..."
              )
            ),

            const SizedBox(height: 32.0),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0)
                ),
                    
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                labelText: "Username ..."
              )
            ),
              
            const SizedBox(height: 32.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0)
                ),

                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                labelText: "Email ..."
              )
            ),
              
            const SizedBox(height: 32.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0)
                ),

                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                labelText: "Password ..."
              ),
              
              obscureText: true,
            ),
          ],
        )
      )
    );
  }
}
