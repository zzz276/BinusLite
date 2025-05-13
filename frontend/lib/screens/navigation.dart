import 'package:binus_lite/models/components/tab.dart' as tab;
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
  static const List<tab.Tab> tabs = [
    tab.Tab(title: "Dashboard", page: Dashboard()),
    tab.Tab(title: "Majors", page: Majors()),
    tab.Tab(title: "Quiz", page: Quiz()),
    tab.Tab(title: "Forum", page: Forum()),
    tab.Tab(title: "Miscellaneous", page: Miscellaneous())
  ];

  String title = tabs[0].title;
  int selectedIndex = 0;

  void selectIndex(int value) {
    setState(() {
      selectedIndex = value;
      title = tabs[value].title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFFFFF),
        centerTitle: true,
        title: Text(title),
        titleTextStyle: const TextStyle(
          color: Color(0xFF018ED5),
          fontFamily: "Century Gothic",
          fontSize: 32.0,
          fontWeight: FontWeight.bold
        ),

        toolbarHeight: 100.0
      ),

      body: Center(child: tabs[selectedIndex].page),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: BottomNavigationBarTheme.of(context).backgroundColor,
        currentIndex: selectedIndex,
        iconSize: 36.0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_objects_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.edit_document), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.forum_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.apps_rounded), label: "")
        ],

        onTap: selectIndex,
        selectedFontSize: 0.0,
        selectedItemColor: const Color(0xFFEDE987),
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 0.0,
        unselectedItemColor: const Color(0xFFFFFFFF)
      ),

      extendBody: true,
      resizeToAvoidBottomInset: false,
    );
  }
}
