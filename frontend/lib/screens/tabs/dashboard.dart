import 'package:binus_lite/helpers/logged_in_user.dart';
import 'package:binus_lite/screens/contents/dashboard/image_carousel.dart';
import 'package:binus_lite/screens/contents/miscellaneous/profile.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String displayName = (LoggedInUser.loggedInUser?.displayName)!;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: const Color(0x00000000),
                height: 300.0,
                padding: const EdgeInsets.only(bottom: 10.0, left: 150.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Welcome,", style: TextStyle(fontSize: 24.0)),
                    Text(
                      displayName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)
                    )
                  ]
                )
              ),

              Image.asset("lib/assets/pictures/Flazz Card.png"),
              Positioned(
                left: 12.0,
                top: 150.0,
                child: (LoggedInUser.loggedInUser?.picture == null) ? 
                CircleAvatar(
                  backgroundColor: const Color(0xFFF2F2F2),
                  radius: 64.0,
                  child: IconButton(
                    icon: const Icon(Icons.person, color: Color(0xFFBBBFC2), size: 100.0),
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute( builder: (context) => const Profile("Profile")))
                  )
                ) : 
                CircleAvatar(
                  backgroundImage: AssetImage((LoggedInUser.loggedInUser?.picture)!),
                  radius: 64.0,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute( builder: (context) => const Profile("Profile"))),
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Color(0x00000000)),
                      elevation: WidgetStatePropertyAll(100.0)
                    ),

                    child: null
                  )
                )
              )
            ]
          ),

          const SizedBox(height: 32.0),
          const ImageCarousel()
        ]
      )
    );
  }
}
