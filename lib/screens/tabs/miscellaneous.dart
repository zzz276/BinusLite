import 'package:binus_lite/screens/contents/miscellaneous/about.dart';
import 'package:binus_lite/screens/login_screen.dart';
import 'package:binus_lite/screens/contents/miscellaneous/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Miscellaneous extends StatefulWidget {
  const Miscellaneous({super.key});

  @override
  State<Miscellaneous> createState() => _MiscellaneousState();
}

class _MiscellaneousState extends State<Miscellaneous> {
  final List<IconData> icons = [
    Icons.person,
    Icons.edit,
    Icons.headset_mic,
    Icons.info,
    Icons.logout
  ];

  final List<String> menus = [
    "Profile",
    "Personalization",
    "Support",
    "About Us",
    "Log Out"
  ];

  int selectedIndex = 0;

  logout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context, MaterialPageRoute(
        builder: (context) => const LoginScreen()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });

                    switch (selectedIndex) {
                      case 0:
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => const Profile()
                          )
                        );

                        break;
                      case 1:
                        
                        break;
                      case 2:
                        
                        break;
                      case 3:
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => const About()
                          )
                        );

                        break;
                      default:
                        AlertDialog(
                          content: Text("Are you sure?"),
                          actions: [
                            TextButton(
                              onPressed: () => logout(context: context),
                              child: Text("Yes")
                            ),

                            TextButton(
                              onPressed: () {

                              },

                              child: Text("No")
                            )
                          ]
                        );
                    }
                  },
        
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(icons[index]),
                      const SizedBox(),
                      Text(menus[index])
                    ]
                  )
                );
              },

              itemCount: menus.length
            )
          )
        ]
      )
    );
  }
}
