import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'get_started.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const Test());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
    );
  }
}

Future<bool> hasSetName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('hasSetName') ?? false;
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //Preload images (next page)
  Future<void> _preloadImages(BuildContext context) async {
    final imagePaths = [
      'C:/Users/moski/Downloads/app/flutter_app/image/Trinity.png',
      'C:/Users/moski/Downloads/app/flutter_app/pic/cloud_sun.png',
      'C:/Users/moski/Downloads/app/flutter_app/pic/cloud.png',
      'C:/Users/moski/Downloads/app/flutter_app/pic/wave.png',
      // 'assets/image3.png',
      // 'assets/image4.png',
      // 'assets/image5.png',
      // Add more image paths as necessary
    ];
    for (final imagePath in imagePaths) {
      await precacheImage(Image.asset(imagePath).image, context);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      _preloadImages(context).then((_) => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyWidget())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Container(
              alignment: Alignment.center,
              child: const Image(
                width: 200,
                height: 200,
                image: AssetImage(
                    "C:/Users/moski/Downloads/app/flutter_app/image/Trinity.png"),
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            alignment: Alignment.bottomCenter,
            child: const Image(
                image: AssetImage(
                    "C:/Users/moski/Downloads/app/flutter_app/pic/Trinity_text.png")),
          )
        ],
      ),
    );
    //   body: Container(
    //       alignment: Alignment.center,
    //       child: Stack(
    //         children: [
    //           Container(
    //             margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
    //             alignment: Alignment.center,
    //             width: 10000,
    //             height: 10000,
    //             child: Lottie.asset(
    //                 'C:/Users/moski/Downloads/app/flutter_app/pic/splash_screen.json'),
    //           )
    //         ],
    //       )),
    // );
  }
}
