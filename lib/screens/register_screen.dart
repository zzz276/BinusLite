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
          password: passwordController.text,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Register successful.'))
        );

        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        if(e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password is too weak.'))
          );
        } else if(e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email is already existed.'))
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to BinusLite!',
              style: TextStyle(
                fontSize: 56.0,
              ),
          
              textAlign: TextAlign.center,
            ),
          
            const SizedBox(height: 76.0,),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
          
            const SizedBox(height: 32.0),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
          
            const SizedBox(height: 32.0),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
          
              obscureText: true,
            ),
          
            const SizedBox(height: 64.0),
            ElevatedButton(
              onPressed: () {
                // Handle registration logic
                register(context: context);
              },
          
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              }, 

              child: const Text(
                'Already have an account? Log in here!',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
