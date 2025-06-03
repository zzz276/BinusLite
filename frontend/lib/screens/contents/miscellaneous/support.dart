import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  const Support(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined),
          iconSize: 60.0,
          onPressed: () => Navigator.pop(context)
        ),

        title: Text(title)
      ),

      body: const Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Need help? Contact us!",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold
              ),

              textAlign: TextAlign.center
            ),

            SizedBox(height: 32.0),
            Card(
              color: Color(0xFF6DCAF6),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_rounded, color: Color(0xFFFFFFFF), size: 64.0),
                    SizedBox(width: 24.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone Number",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold
                          )
                        ),
                
                        Text(
                          "08123456789",
                          style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0)
                        )
                      ]
                    )
                  ]
                )
              )
            ),

            SizedBox(height: 16.0),
            Card(
              color: Color(0xFF6DCAF6),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.mail_rounded, color: Color(0xFFFFFFFF), size: 64.0),
                    SizedBox(width: 24.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "E-mail",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold
                          )
                        ),
                
                        Text(
                          "binussupport@binus.edu",
                          style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0)
                        )
                      ]
                    )
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}
