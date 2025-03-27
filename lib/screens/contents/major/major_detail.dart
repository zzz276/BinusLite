import 'package:binus_lite/models/majors.dart';
import 'package:flutter/material.dart';

class MajorDetail extends StatelessWidget {
  const MajorDetail({
    required this.major,
    super.key
  });

  final Majors major;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: const Icon(Icons.chevron_left_outlined)
        ),

        title: Text(major.name),
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
