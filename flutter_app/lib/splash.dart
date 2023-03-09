import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.fromLTRB(45, 250, 0, 0),
              child: const Image(
                image: AssetImage("assets/Logobig.png"),
                width: 300,
                height: 300,
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(45, 140, 0, 0),
            child: const Image(image: AssetImage("assets/Trinity.png")),
          )
        ],
      ),
    );
  }
}
