import 'package:binus_lite/models/major.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MajorDetail extends StatelessWidget {
  const MajorDetail({super.key, required this.major});
  final Major major;

  viewFile(BuildContext context) async {
    try { await launchUrlString(major.catalogueLink!); }
    catch (err) {
      // debugPrint("Catalogue link isn't available at this time.");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(
          "Catalogue link isn't available at this time."
        ))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left_outlined)
        ),

        title: Text("${major.name}\n@${major.region}")
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Profile"),
            const SizedBox(height: 16.0),
            const Text("Overview"),
            Text(major.overview),
            const SizedBox(height: 16.0),
            const Text("Promotional Video"),
            const SizedBox(height: 16.0),
            const Text("Catalogues"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => viewFile(context),
              child: const SizedBox(
                width: double.infinity,
                child: Text("View and Download Catalogue")
              )
            )
          ]
        )
      )
    );
  }
}
