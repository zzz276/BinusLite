import 'package:binus_lite/screens/contents/dashboard/imageCarousel.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("lib/assets/pictures/Flazz Card.png"),
        ImageCarousel()
      ]
    );
  }
}
