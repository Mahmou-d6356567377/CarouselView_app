import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CarouselController controller = CarouselController(initialItem: 1);
  List<AssetImage> imageslist = [
    AssetImage('assets/images/female1.webp'),
    AssetImage('assets/images/female2.webp'),
    AssetImage('assets/images/male1.webp'),
    AssetImage('assets/images/male2.webp'),
    AssetImage('assets/images/male3.webp'),
  ];

  List<Color> colorlist = [
    Colors.black,
    Colors.grey,
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.blue,
  ];
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height * .5),
              child: CarouselView.weighted(
                itemSnapping: true,
                reverse: true,
                flexWeights: <int>[1, 7, 1],
                // This helps you to provide a width percentage
                controller: controller,
                // 
                children: imageslist
                    .map((image) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: image, fit: BoxFit.cover)),
                        ))
                    .toList(),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height * .1),
              child: CarouselView.weighted(
                itemSnapping: true,
                reverse: true,
                flexWeights: <int>[1, 3, 1],
                controller: controller,
                children: colorlist
                    .map((color) => Container(
                          decoration: BoxDecoration(
                            color: color,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  } 
}
