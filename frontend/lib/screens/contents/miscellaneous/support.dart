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
          onPressed: () => Navigator.of(context).pop()
        ),

        title: Text(title)
      ),

      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Need help? Contact us!",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center
            ),

            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color(0xFF6DCAF6))),
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.phone_rounded, color: Color(0xFFFFFFFF), size: 48.0),
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
                  
                          Text("08123456789", style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0))
                        ]
                      )
                    ]
                  )
                )
              )
            ),

            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color(0xFF6DCAF6))),
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.mail_rounded, color: Color(0xFFFFFFFF), size: 48.0),
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
                  
                          Text("binussupport@binus.edu", style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0))
                        ]
                      )
                    ]
                  )
                )
              )
            )
          ]
        )
      )
    );
  }
}
