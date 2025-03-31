import 'package:binus_lite/screens/contents/dashboard/image_carousel.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String displayName = "Omega";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("lib/assets/pictures/Flazz Card.png"),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox.square(
              dimension: 32.0,
              child: Icon(Icons.person)
            ),

            const SizedBox.square(dimension: 32.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome,"),
                Text(
                  displayName,
                  style: const TextStyle(fontWeight: FontWeight.bold)
                )
              ]
            )
          ]
        ),

        const SizedBox(height: 8.0),
        const Text(
          "Campus Directory",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const ImageCarousel()
      ]
    );
  }
}
