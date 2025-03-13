import 'package:final_exam/apis/api.dart';
import 'package:final_exam/screens/detailScreen.dart';
import 'package:final_exam/screens/loginScreen.dart';
import 'package:final_exam/screens/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> subjects = ['MAT'];
  final Future<String> numberFact = retrieveNumberFact();
  var data;

  logout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          badges.Badge(
            badgeAnimation: const badges.BadgeAnimation.slide(
              animationDuration: Duration(milliseconds: 300),
            ),

            badgeContent: const Text(
              '0',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            child: const Icon(Icons.pageview_outlined),
            onTap: () {

            },
          ),

          IconButton(
            icon: const Icon(Icons.info_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
          ),

          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () {
              logout(context: context);
            },

            color: Colors.red,
          ),
        ],

        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: const Text('BinusLite'),
      ),

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 24.0,),
          FutureBuilder(
            future: numberFact, 
            builder: (context, snapshot) {
              var data = snapshot.data;

              if(data != null) {
                return Text(
                  '"$data"',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),

                  textAlign: TextAlign.center,
                );
              } else {
                return const Text(
                  '-',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),

                  textAlign: TextAlign.center,
                );
              }
            }
          ),

          const SizedBox(height: 16.0,),
          Expanded(
            child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 50.0,),
                      Text(
                        subjects[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),

                        textAlign: TextAlign.start,
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(title: subjects[index])
                            ),
                          );
                        },

                        child: const Text(
                          'View',
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
