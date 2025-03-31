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

  register({required BuildContext context}) async {
    if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(
            "Register successful."
          ))
        );

        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        if(e.code.compareTo("weak-password") == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(
              "Password is too weak."
            ))
          );
        } else if(e.code.compareTo("email-already-in-use") == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(
              "Email is already existed."
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
            colors: [Color(0xFF6DCAF6), Color(0xFF989898)],
            end: Alignment.bottomCenter
          )
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to BinusLite",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold
                  ),

                  textAlign: TextAlign.center
                ),
              
                const SizedBox(height: 64.0),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)
                    ),
                    
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    hintText: "Username ..."
                  )
                ),
              
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
                    fillColor: const Color(0xFFFFFFFF),
                    hintText: "Password ..."
                  ),
              
                  obscureText: true
                ),
              
                const SizedBox(height: 64.0),
                ElevatedButton(
                  onPressed: () => register(context: context),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold
                      ),

                      textAlign: TextAlign.center
                    )
                  )
                ),
          
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Already have an account? Log in here!",
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
