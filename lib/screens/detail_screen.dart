// import 'package:final_exam/screens/introduction.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String title;

  const ProductDetailsScreen({super.key, required this.title});

  void viewFile() async {
    const url = "https://curriculum.binus.ac.id/files/2012/04/SOCS-Mobile-Application-Technology-2023.pdf";

    try {
      await launchUrlString(url);
    } catch (err) {
      debugPrint("Something went wrong.");
    }
  }

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
                  onPressed: viewFile,
                  // () {
                  //   Navigator.push(
                  //   context, 
                  //   MaterialPageRoute(builder: (context) => const Introduction())
                  //   );
                  // }

                  child: const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'View and Download Latest Catalogue',
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
