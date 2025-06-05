import 'package:binus_lite/models/components/image.dart' as carousel;
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<carousel.Image> images = const [
    carousel.Image(
      link: "lib/assets/pictures/carousel/Binus-Anggrek-001.png",
      caption: "Binus @Kemanggisan, Anggrek Campus"
    ),

    carousel.Image(
      link: "lib/assets/pictures/carousel/Binus-Bekasi-002.png",
      caption: "Binus @Bekasi"
    ),

    carousel.Image(
      link: "lib/assets/pictures/carousel/Binus-Malang-003.png",
      caption: "Binus @Malang"
    )
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Campus Directory", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 512.0,
          child: PageView.builder(
            onPageChanged: (index) => setState(() => selectedIndex = index),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(images[index].link, fit: BoxFit.cover, height: 333.0),
                  const SizedBox(height: 16.0),
                  Text(images[index].caption, style: const TextStyle(fontSize: 16.0))
                ]
              );
            },

            itemCount: images.length
          )
        )
      ]
    );
  }
}
