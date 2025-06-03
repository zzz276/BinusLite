import 'package:binus_lite/helpers/logged_in_user.dart';
import 'package:binus_lite/models/components/menu.dart';
import 'package:binus_lite/screens/contents/miscellaneous/about.dart';
import 'package:binus_lite/screens/contents/miscellaneous/support.dart';
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
      icon: Icon(Icons.person, size: 36.0),
      text: Text("Profile", style: TextStyle(fontSize: 24.0))
    ),

    Menu(
      icon: Icon(Icons.headset_mic, size: 36.0),
      text: Text("Support", style: TextStyle(fontSize: 24.0))
    ),

    Menu(
      icon: Icon(Icons.info, size: 36.0),
      text: Text("About Us", style: TextStyle(fontSize: 24.0))
    ),

    Menu(
      icon: Icon(Icons.logout, color: Color(0xFF950000), size: 36.0),
      text: Text(
        "Log Out",
        style: TextStyle(color: Color(0xFF750000), fontSize: 24.0)
      )
    )
  ];

  int selectedIndex = 0;

  logout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  navigate(BuildContext context, int index) {
     switch (index) {
      case 0:
        return Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Profile(menus[index].text.data!))
        );

      case 1:
        return Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Support(menus[index].text.data!))
        );

      case 2:
        return Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => About(menus[index].text.data!))
        );

      default:
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  logout(context: context);
                  LoggedInUser.loggedInUser = null;
                },

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

                  style: const ButtonStyle(foregroundColor: WidgetStatePropertyAll(Color(0xFF000000))),
                  child: Row(children: [menus[index].icon, const SizedBox(width: 32.0), menus[index].text])
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
