import 'package:binus_lite/helpers/logged_in_user.dart';
import 'package:binus_lite/screens/contents/dashboard/image_carousel.dart';
import 'package:binus_lite/screens/contents/miscellaneous/profile.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard(this.shortcutTitle, {super.key});
  final String shortcutTitle;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String displayName = LoggedInUser.loggedInUser!.displayName;
  String? profilePicture = LoggedInUser.loggedInUser!.picture;

  void changeProfilePicture() async {
    String? picture = await Navigator.of(context).push(MaterialPageRoute( builder: (context) => Profile(widget.shortcutTitle)));

    setState(() {
      profilePicture = picture;
      LoggedInUser.loggedInUser!.picture = picture;
    });
  }

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
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)
                    )
                  ]
                )
              ),

              Image.asset("lib/assets/pictures/Flazz Card.png"),
              Positioned(
                left: 12.0,
                top: 150.0,
                child: GestureDetector(
                  onTap: changeProfilePicture,
                  child: (profilePicture == null || profilePicture == '') ? 
                  const CircleAvatar(
                    backgroundColor: Color(0xFFF2F2F2),
                    radius: 64.0,
                    child: Icon(Icons.person, color: Color(0xFFBBBFC2), size: 100.0)
                  ) : 
                  CircleAvatar(
                    backgroundImage: AssetImage(profilePicture!),
                    radius: 64.0
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
