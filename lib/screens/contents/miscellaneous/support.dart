import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  const Support(this.title, {super.key});
  final String title;

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

        title: Text(title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Text("A")
          ],
        )
      ),
    );
  }
}
