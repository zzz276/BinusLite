import 'package:final_exam/models/team_member.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  List<TeamMember> setTeamMembers() {
    final List<String> names = [
      'Marvello Perdana',
      'Welan Ale Zeni',
      'Zeni Zuanda'
    ];

    final List<String> ids = [
      '2702302795',
      '2702357674',
      '2702343694'
    ];

    final List<String> photos = [
      'acdfac44-b16b-49ac-8bdb-243970a4451c',
      'bd0130b6-2b3b-412d-b37a-3df0b4af7f24',
      'cecceeb1-5696-4755-ae31-2add9ad91bda'
    ];

    List<TeamMember> teamMembers = [];

    for (var i = 0; i < ids.length; i++) {
      teamMembers.add(TeamMember(
        name: names[i],
        id: ids[i],
        photo: photos[i]
      ));
    }

    return teamMembers;
  }

  @override
  Widget build(BuildContext context) {
    late List<TeamMember> teamMembers = setTeamMembers();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text('Team Profile'),
      ),

      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: ListView.builder(
            itemCount: teamMembers.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30.0)
                    ),

                    padding: const EdgeInsets.all(50.0),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Image(image: AssetImage('lib/assets/pictures/${teamMembers[index].photo}.jpg'),),
                        const SizedBox(height: 25.0,),
                        Text(
                          teamMembers[index].id,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                          ),
                        ),

                        Text(
                          teamMembers[index].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50.0,)
                ],
              );
            }
          ),
        ),
      )
    );
  }
}
