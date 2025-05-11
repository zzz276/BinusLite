import 'package:binus_lite/models/major.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MajorDetail extends StatefulWidget {
  final Major major;
  const MajorDetail(this.major, {super.key});
  
  @override
  State<MajorDetail> createState() => _MajorDetailState();
}

class _MajorDetailState extends State<MajorDetail> {
  late Major major;

  viewFile(BuildContext context) async {
    try { await launchUrlString(major.catalogueLink!); }
    catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(
          "Catalogue link isn't available at this time."
        ))
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    major = widget.major;
  }

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

        title: Text("${major.name}\n@${major.region}")
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Profile", style: TextStyle(fontSize: 32.0)),
            Table(
              columnWidths: const {
                0: FixedColumnWidth(150.0),
                1:FlexColumnWidth()
              },

              children: [
                TableRow(
                  children: [
                    const Text("Established"),
                    Text(
                      major.foundedYear.toString(),
                      textAlign: TextAlign.end
                    )
                  ]
                ),

                TableRow(
                  children: [
                    const Text("Faculty"),
                    Text(
                      major.faculty,
                      textAlign: TextAlign.end
                    )
                  ]
                ),

                TableRow(
                  children: [
                    const Text("Duration"),
                    Text(
                      "${major.duration.toString()} years",
                      textAlign: TextAlign.end,
                    )
                  ]
                ),

                TableRow(
                  children: [
                    const Text("Academic Title"),
                    Text(
                      major.title,
                      textAlign: TextAlign.end,
                    )
                  ]
                )
              ]
            ),

            const SizedBox(height: 16.0),
            const Text("Overview", style: TextStyle(fontSize: 32.0)),
            Text(major.overview),
            const SizedBox(height: 16.0),
            const Text("Prospective Careers", style: TextStyle(fontSize: 32.0)),
            Text(major.career),
            const SizedBox(height: 16.0),
            const Text("Promotional Video", style: TextStyle(fontSize: 32.0)),
            const SizedBox(height: 16.0),
            const Text("Catalogues", style: TextStyle(fontSize: 32.0)),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => viewFile(context),
              child: const SizedBox(
                width: double.infinity,
                child: Text("Download and View Catalogue", textAlign: TextAlign.center)
              )
            )
          ]
        )
      )
    );
  }
}
