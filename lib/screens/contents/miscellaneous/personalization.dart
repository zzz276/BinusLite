import 'package:flutter/material.dart';

class Personalization extends StatefulWidget {
  const Personalization(this.title, {super.key});
  final String title;

  @override
  State<Personalization> createState() => _PersonalizationState();
}

class _PersonalizationState extends State<Personalization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined),
          iconSize: 60.0,
          onPressed: () => Navigator.pop(context),
        ),

        title: const Text("Personalization"),
      ),

      body: const Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: [
            Text("A")
          ],
        )
      ),
    );
  }
}
