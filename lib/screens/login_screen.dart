import 'package:binus_lite/screens/navigation.dart';
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

  login({required BuildContext context}) async {
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Navigation()
          )
        );
      } on FirebaseAuthException catch (e) {
        if(e.code.compareTo("user-not-found") == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(
              "User isn't existed."
            ))
          );
        } else if(e.code.compareTo("wrong-password") == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(
              "Password isn't correct."
            ))
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Color(0xFF018ED5), Color(0xFF7E3586)],
            end: Alignment.bottomCenter
          ),
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/assets/pictures/BinusLite Logo NoBack.png"),
                const SizedBox(height: 32.0),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)
                    ),

                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    hintText: "Email ..."
                  )
                ),

                const SizedBox(height: 32.0),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)
                    ),

                    filled: true,
                    fillColor:const Color(0xFFFFFFFF),
                    hintText: "Password ..."
                  ),
                  
                  obscureText: true
                ),

                const SizedBox(height: 64.0),
                ElevatedButton(
                  onPressed: () => login(context: context),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold
                      ),

                      textAlign: TextAlign.center,
                    )
                  )
                ),

                TextButton(
                  onPressed: () => Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => const RegisterScreen()
                    )
                  ),

                  child: const Text(
                    "Didn't have an account? Register here!",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold
                    )
                  )
                )
              ]
            )
          )
        )
      )
    );
  }
}
