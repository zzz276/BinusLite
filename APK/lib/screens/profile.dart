import 'package:final_exam/models/team_member.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  List<TeamMember> setTeamMembers() {
    final List<String> names = [
      'Gabriel Jovico Prathama',
      'Marvello Perdana',
      'Riansyah Hazmi Halomoan Abdian',
      'Tobyas Nathaniel Triwira Nababan',
      // 'Welan Ale Zeni',
      'Zeni Zuanda'
    ];

    List<TeamMember> teamMembers = [];

    for (var i = 0; i < names.length; i++) teamMembers.add(TeamMember(name: names[i]));

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

        title: const Text('Credits'),
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
                  Text(
                    teamMembers[index].name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.0
                    ),
                  ),

                  const SizedBox(height: 32.0,)
                ],
              );
            }
          ),
        ),
      )
    );
  }
}
