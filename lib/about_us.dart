import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 70),
          child: const Align(
              alignment: Alignment.topCenter,
              child: Image(
                width: 280,
                image: AssetImage(
                  "C:/Users/moski/Downloads/app/flutter_app/pic/Group 36722.png",
                ),
                fit: BoxFit.cover,
              )),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 90),
          child: const Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(
                  "C:/Users/moski/Downloads/app/flutter_app/pic/1stbanner.png",
                ),
                fit: BoxFit.cover,
              )),
        ),
      ],
    ));
  }
}
