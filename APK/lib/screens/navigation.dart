import 'package:final_exam/screens/tabs/dashboard.dart';
import 'package:final_exam/screens/tabs/forum.dart';
import 'package:final_exam/screens/tabs/majors.dart';
import 'package:final_exam/screens/tabs/more.dart';
import 'package:final_exam/screens/tabs/quiz.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  static final List<String> titles = ["BinusLite", "Majors", "Quiz", "Forum", "More"];

  String title = titles[0];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
      ),

      body: Center(
        child: <Widget>[Dashboard(), Majors(), Quiz(), Forum(), More()][selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        currentIndex: selectedIndex,
        items: [
          const BottomNavigationBarItem(
            icon: const Icon(Icons.home_filled),
            label: "Dashboard"
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.emoji_objects_rounded),
            label: titles[1]
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.edit_document),
            label: titles[2]
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.forum_rounded),
            label: titles[3]
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.apps_rounded),
            label: titles[4]
          ),
        ],

        onTap: (value) {
          setState(() {
            selectedIndex = value;
            title = titles[value];
          });
        },

        selectedItemColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
