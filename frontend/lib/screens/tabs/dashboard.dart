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
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.transparent,
                height: 300.0,
                padding: const EdgeInsets.only(bottom: 10.0, left: 150.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Welcome,",
                      style: TextStyle(fontSize: 24.0)
                    ),

                    Text(
                      displayName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ],
                ),
              ),

              Image.asset("lib/assets/pictures/Flazz Card.png"),
              Positioned(
                left: 15.0,
                top: 150.0,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: const Color(0xFFF2F2F2),
                    shape: BoxShape.circle
                  ),

                  height: 125.0,
                  width: 125.0,
                  child: const Icon(
                    Icons.person,
                    color: Color(0xFFBBBFC2),
                    size: 100.0
                  )
                )
              )
            ]
          ),

          const SizedBox(height: 32.0),
          const ImageCarousel()
        ]
      ),
    );
  }
}
