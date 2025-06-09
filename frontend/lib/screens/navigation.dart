import 'package:binus_lite/models/components/tab.dart' as tab;
import 'package:binus_lite/models/forum_post.dart';
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
  final String forumTitle = "Forum";
  final String majorTitle = "Majors";
  final List<ForumPost> posts = [
    ForumPost(
      question: "Is Mobile Application and Technology a good major?",
      username: "AAA"
    ),

    ForumPost(
      question: "What are the reasons behind the students to enroll in Psychology?",
      username: "BBB",
      voteCount: 2
    )
  ];

  final List<Major> majors = [
    Major(
      name: "Mobile Application and Technology",
      region: "Kemanggisan",
      faculty: "School of Computer Science",
      foundedYear: 2010,
      duration: 4,
      title: "S. Kom.",
      overview: "Mobile Application and IoT Engineer",
      career: "Mobile Engineer",
      videoLink: "https://www.youtube.com/watch?v=ocbpJPgkl3w&list=PLVfxj2HRUAZEN_XxPsLqizEwPRHI-RR2c&index=40",
      catalogueLink: "https://curriculum.binus.ac.id/files/2012/04/SOCS-Mobile-Application-Technology-2023.pdf"
    ),

    Major(
      name: "Artificial Intelligence",
      region: "Kemanggisan",
      faculty: "School of Computer Science",
      foundedYear: 2023,
      duration: 4,
      title: "S. Kom.",
      overview: "Machine Learning, Deep Learning, Natural Language Processing",
      career: "Machine Learning and Deep Learning Engineer"
    ),

    Major(
      name: "Computer Science",
      region: "Alam Sutera",
      faculty: "School of Computer Science",
      foundedYear: 1987,
      duration: 4,
      title: "S. Kom.",
      overview: "Software Engineer",
      career: "Developer, IT Consultant"
    )
  ];

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
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
            widget.majors.where((major) => major.isWatched == true).toList(),
            widget.majorTitle
          )));
        }
      );
    }

    if (index == 3) {
      return FloatingActionButton.extended(
        icon: const Icon(Icons.add_rounded),
        label: const Text("Add Forum"),
        onPressed: () => postForum(context, widget.forumTitle)
      );
    }

    return null;
  }

  void postForum(BuildContext context, String title) async {
    ForumPost post = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => MakeForum(title)));

    widget.posts.add(post);
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
      tab.Tab(title: "Dashboard", page: const Dashboard()),
      tab.Tab(title: widget.majorTitle, page: Majors(widget.majors)),
      tab.Tab(title: "Quiz", page: const Quiz()),
      tab.Tab(title: widget.forumTitle, page: Forum(widget.forumTitle, widget.posts)),
      tab.Tab(title: "Miscellaneous", page: const Miscellaneous())
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
