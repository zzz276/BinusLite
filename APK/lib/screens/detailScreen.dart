import 'package:final_exam/screens/introduction.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String title;

  const ProductDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
        title: Text(title),
      ),

      body: Column(
        children: [
          // Image designed by Freepik
          const Image(image: AssetImage('lib/assets/pictures/hand-drawn-scientific-formulas-chalkboard/3658422.jpg'),),
          const Text(
            'Image designed by Freepik',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                Text(
                  'A comprehensive introduction on "$title".',
                  style: const TextStyle(color: Colors.white,),
                  textAlign: TextAlign.start,
                ),

                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const Introduction())
                    );
                  },

                  child: const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Read',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
