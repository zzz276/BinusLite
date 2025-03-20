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
          password: passwordController.text,
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Navigation())
        );
      } on FirebaseAuthException catch (e) {
        if(e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User isn\'t existed.'))
          );
        } else if(e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password isn\'t correct.'))
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade100, Colors.deepPurple.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BinusLite',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 96.0),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),

                const SizedBox(height: 16.0),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  
                  obscureText: true,
                ),

                const SizedBox(height: 24.0),
                ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () {
                    login(context: context);
                  },

                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen())
                    );
                  }, 

                  child: const Text(
                    'No account? Register here!',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
