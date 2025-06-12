import 'package:binus_lite/helpers/logged_in_user.dart';
import 'package:binus_lite/models/components/menu.dart';
import 'package:binus_lite/screens/contents/miscellaneous/about.dart';
import 'package:binus_lite/screens/contents/miscellaneous/support.dart';
import 'package:binus_lite/screens/contents/miscellaneous/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Miscellaneous extends StatefulWidget {
  const Miscellaneous(this.menus, {super.key});
  final List<Menu> menus;

  @override
  State<Miscellaneous> createState() => _MiscellaneousState();
}

class _MiscellaneousState extends State<Miscellaneous> {
  int selectedIndex = 0;

  logout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).popUntil(ModalRoute.withName('/'));
  }

  navigate(BuildContext context, int index) {
     switch (index) {
      case 0: return Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile(widget.menus[index].text.data!)));
      case 1: return Navigator.of(context).push(MaterialPageRoute(builder: (context) => Support(widget.menus[index].text.data!)));
      case 2: return Navigator.of(context).push(MaterialPageRoute(builder: (context) => About(widget.menus[index].text.data!)));
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

              TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text("No"))
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
                  child: Row(children: [widget.menus[index].icon, const SizedBox(width: 32.0), widget.menus[index].text])
                );
              },

              itemCount: widget.menus.length
            )
          )
        ]
      )
    );
  }
}
