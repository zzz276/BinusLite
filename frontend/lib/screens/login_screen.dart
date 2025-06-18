import 'package:binus_lite/apis/api.dart';
import 'package:binus_lite/helpers/logged_in_user.dart';
import 'package:binus_lite/helpers/snack_bar.dart';
import 'package:binus_lite/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void clearInputs() {
    emailController.clear();
    passwordController.clear();
  }

  login({required BuildContext context}) async {
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        await logIn(context, emailController.text, passwordController.text);
        if (LoggedInUser.loggedInUser != null) {
          Navigator.of(context).pushNamed('/navigation');
          clearInputs();
        }
      } on FirebaseAuthException catch (e) {
        if(e.code.compareTo("user-not-found") == 0) { showSnackBar(context, "User isn't existed"); } 
        else if(e.code.compareTo("wrong-password") == 0) { showSnackBar(context, "Password isn't correct"); }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [Color(0xFF018ED5), Color(0xFF7E3586)],
          end: Alignment.bottomCenter
        )
      ),

      child: Scaffold(
        backgroundColor: const Color(0x00000000),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 64.0),
              Image.asset("lib/assets/pictures/BinusLite Logo NoBack.png"),
              const SizedBox(height: 64.0),
              TextField(controller: emailController, decoration: const InputDecoration(hintText: "Email ...")),
              const SizedBox(height: 32.0),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: "Password ..."),
                obscureText: true
              ),

              const SizedBox(height: 64.0),
              ElevatedButton(
                onPressed: () => login(context: context),
                child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center
                  )
                )
              ),

              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterScreen()));
                  clearInputs();
                },

                child: const Text("Didn't have an account? Register here!", style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold))
              )
            ]
          )
        )
      )
    );
  }
}
