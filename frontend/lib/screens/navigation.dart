import 'package:binus_lite/models/components/menu.dart';
import 'package:binus_lite/models/components/tab.dart' as tab;
import 'package:binus_lite/models/major.dart';
import 'package:binus_lite/screens/contents/forum/make_forum.dart';
import 'package:binus_lite/screens/contents/major/watchlist.dart';
import 'package:binus_lite/screens/tabs/dashboard.dart';
import 'package:binus_lite/screens/tabs/forum.dart';
import 'package:binus_lite/screens/tabs/majors.dart';
import 'package:binus_lite/screens/tabs/miscellaneous.dart';
import 'package:binus_lite/screens/tabs/quiz.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  Navigation({super.key});
  // final List<ForumPost> posts = [
  //   ForumPost(
  //     postID: 0,
  //     question: "Is Mobile Application and Technology a good major?",
  //     voteCount: 0,
  //     username: "AA"
  //   ),

  //   ForumPost(
  //     postID: 0,
  //     question: "What are the reasons behind the students to enroll in Psychology?",
  //     voteCount: 2,
  //     username: "BB"
  //   )
  // ];

  final List<Major> majors = [
    Major(
      id: 0,
      name: "Mobile Application and Technology",
      region: "Kemanggisan",
      faculty: "School of Computer Science",
      foundedYear: 2010,
      duration: 4,
      title: "S. Kom.",
      overview: "Mobile Application and IoT Engineer",
      career: "Mobile Engineer",
      videoLink: "https://www.youtube.com/watch?v=ocbpJPgkl3w&list=PLVfxj2HRUAZEN_XxPsLqizEwPRHI-RR2c&index=40",
      catalogueLink: "https://curriculum.binus.ac.id/files/2012/04/SOCS-Mobile-Application-Technology-2023.pdf",
      isWatched: false
    ),

    Major(
      id: 1,
      name: "Artificial Intelligence",
      region: "Kemanggisan",
      faculty: "School of Computer Science",
      foundedYear: 2023,
      duration: 4,
      title: "S. Kom.",
      overview: "Machine Learning, Deep Learning, Natural Language Processing",
      career: "Machine Learning and Deep Learning Engineer",
      isWatched: false
    ),

    Major(
      id: 2,
      name: "Computer Science",
      region: "Alam Sutera",
      faculty: "School of Computer Science",
      foundedYear: 1987,
      duration: 4,
      title: "S. Kom.",
      overview: "Software Engineer",
      career: "Developer, IT Consultant",
      isWatched: false
    )
  ];

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
      text: Text("Log Out", style: TextStyle(color: Color(0xFF750000), fontSize: 24.0))
    )
  ];

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final String forumTitle = "Forum";
  final String majorTitle = "Majors";
  late List<Major> majors;
  late List<tab.Tab> tabs;
  late String title;
  late int selectedIndex;

  FloatingActionButton? showFAB(int index) {
    if (index == 1) {
      return FloatingActionButton.extended(
        icon: const Icon(Icons.bookmark_rounded),
        label: const Text("Watchlist"),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Watchlist(
            majors.where((major) => major.isWatched == true).toList(),
            majorTitle
          )));
        }
      );
    }

    if (index == 3) {
      return FloatingActionButton.extended(
        icon: const Icon(Icons.add_rounded),
        label: const Text("Add Forum"),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MakeForum(forumTitle)))
      );
    }

    return null;
  }

  void selectIndex(int value) {
    setState(() {
      selectedIndex = value;
      title = tabs[value].title;
    });
  }

  @override
  void initState() {
    super.initState();
    tabs = [
      tab.Tab(title: "Dashboard", page: Dashboard((widget.menus[0].text.data)!)),
      tab.Tab(title: majorTitle, page: Majors(majors)),
      tab.Tab(title: "Quiz", page: const Quiz()),
      tab.Tab(title: forumTitle, page: Forum(forumTitle)),
      tab.Tab(title: "Miscellaneous", page: Miscellaneous(widget.menus))
    ];

    title = tabs[0].title;
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (selectedIndex == 0) ? null : AppBar(
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
      floatingActionButton: showFAB(selectedIndex),
      resizeToAvoidBottomInset: false
    );
  }
}
