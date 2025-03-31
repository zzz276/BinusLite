import 'package:binus_lite/models/menu.dart';
import 'package:binus_lite/screens/contents/miscellaneous/about.dart';
import 'package:binus_lite/screens/contents/miscellaneous/personalization.dart';
import 'package:binus_lite/screens/contents/miscellaneous/support.dart';
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
  final List<Menu> menus = const [
    Menu(
      icon: Icon(Icons.person),
      text: Text(
        "Profile",
        style: TextStyle(fontWeight: FontWeight.bold)
      )
    ),

    Menu(
      icon: Icon(Icons.edit),
      text: Text(
        "Personalization",
        style: TextStyle(fontWeight: FontWeight.bold)
      )
    ),

    Menu(
      icon: Icon(Icons.headset_mic),
      text: Text(
        "Support",
        style: TextStyle(fontWeight: FontWeight.bold)
      )
    ),

    Menu(
      icon: Icon(Icons.info),
      text: Text(
        "About Us",
        style: TextStyle(fontWeight: FontWeight.bold)
      )
    ),

    Menu(
      icon: Icon(
        Icons.logout,
        color: Color(0xFF950000)
      ),

      text: Text(
        "Log Out",
        style: TextStyle(
          color: Color(0xFF750000),
          fontWeight: FontWeight.bold
        )
      )
    )
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

  navigate(BuildContext context, int index) {
     switch (index) {
      case 0:
        return Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => Profile(menus[index].text.data!)
          )
        );
      case 1:
        return Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => Personalization(menus[index].text.data!)
          )
        );
      case 2:
        return Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => Support(menus[index].text.data!)
          )
        );
      case 3:
        return Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => About(menus[index].text.data!)
          )
        );
      default:
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () => logout(context: context),
                child: const Text("Yes")
              ),

              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("No")
              )
            ],

            content: const Text("Do you really want to quit?"),
            title: const Text("Attention!")
          );
        });
    }
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
                    setState(() => selectedIndex = index);
                    navigate(context, index);
                  },

                  style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Color(0xFF000000))
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      menus[index].icon,
                      const SizedBox(),
                      menus[index].text
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
