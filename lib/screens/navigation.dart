import 'package:binus_lite/screens/tabs/dashboard.dart';
import 'package:binus_lite/screens/tabs/forum.dart';
import 'package:binus_lite/screens/tabs/majors.dart';
import 'package:binus_lite/screens/tabs/miscellaneous.dart';
import 'package:binus_lite/screens/tabs/quiz.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  static final List<String> titles = ["Dashboard", "Majors", "Quiz", "Forum", "Miscellaneous"];
  String title = titles[0];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const <Widget>[Dashboard(), Majors(), Quiz(), Forum(), Miscellaneous()][selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        currentIndex: selectedIndex,
        iconSize: 36.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: ""
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_objects_rounded),
            label: ""
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: ""
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.forum_rounded),
            label: ""
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.apps_rounded),
            label: ""
          ),
        ],

        onTap: (value) {
          setState(() {
            selectedIndex = value;
            title = titles[value];
          });
        },

        selectedFontSize: 0.0,
        selectedItemColor: Colors.yellow,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 0.0,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
