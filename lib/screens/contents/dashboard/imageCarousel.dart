import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<String> images = [
    'lib/assets/pic1.jpg',
    'lib/assets/pic2.jpg',
    'lib/assets/pic4.jpg',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 0.0,),
        Container(
          height: 200.0,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),

        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: selectedIndex == index ? 12.0 : 8.0,
              height: selectedIndex == index ? 12.0 : 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedIndex == index ? Colors.green : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
