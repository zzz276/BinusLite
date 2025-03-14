// import 'package:final_exam/apis/api.dart';
// import 'package:final_exam/screens/loginScreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // logout({required BuildContext context}) async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.pushReplacement(
  //     context, 
  //     MaterialPageRoute(builder: (context) => const LoginScreen()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Image",
          // style: TextStyle(
          //   color: Colors.white
          // ),

          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
