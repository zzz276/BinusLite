import 'package:flutter/material.dart';

class MajorDetail extends StatelessWidget {
  const MajorDetail({
    required this.title,
    required this.faculty,
    required this.foundedYear,
    required this.overview,
    required this.videoLink,
    super.key
  });

  final String title;
  final String faculty;
  final String foundedYear;
  final String overview;
  final String videoLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(Icons.chevron_left_outlined)
        ),

        title: Text(title),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0), 
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
