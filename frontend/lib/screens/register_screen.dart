import 'package:binus_lite/apis/api.dart';
import 'package:binus_lite/helpers/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void back(BuildContext context) {
    Navigator.of(context).pop();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  register({required BuildContext context}) async {
    if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try { await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text); }
      on FirebaseAuthException catch (e) {
        if(e.code.compareTo("weak-password") == 0) {
          showSnackBar(context, "Password is too weak");
        } else if(e.code.compareTo("email-already-in-use") == 0) {
          showSnackBar(context, "Email is already existed");
        }
      }

      signUp(
        context,
        nameController.text,
        nameController.text,
        emailController.text,
        passwordController.text
      ).then((value) { if (value) { back(context); }});
      back(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [Color(0xFF6DCAF6), Color(0xFF989898)],
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
              const SizedBox(height: 92.0),
              const Text(
                "Welcome to BinusLite",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold
                ),

                textAlign: TextAlign.center
              ),
                    
              const SizedBox(height: 92.0),
              TextField(controller: nameController, decoration: const InputDecoration(hintText: "Username ...")),
              const SizedBox(height: 32.0),
              TextField(controller: emailController, decoration: const InputDecoration(hintText: "Email ...")),
              const SizedBox(height: 32.0),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: "Password ..."),
                obscureText: true
              ),
                
              const SizedBox(height: 64.0),
              ElevatedButton(
                onPressed: () {
                  register(context: context);

                },

                child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Register",
                    style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center
                  )
                )
              ),
              
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () => back(context),
                child: const Text("Already have an account? Log in here!", style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold))
              )
            ]
          )
        )
      )
    );
  }
}
