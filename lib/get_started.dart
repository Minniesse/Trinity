import 'package:flutter/material.dart';
import 'Home.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 70),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(242, 54),
              foregroundColor: const Color(0xffaf6900),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
                side: const BorderSide(
                  color: Color(0xffe09007),
                  width: 2.14,
                ),
              ),
            ),
            child: const Text("Get Started",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                )),
          ),
        ),
      ),
      Container(
          margin: const EdgeInsets.only(top: 40),
          child: const Align(
            alignment: Alignment.topCenter,
            child: Image(
              height: 150,
              image: AssetImage(
                "C:/Users/moski/Downloads/app/flutter_app/image/Trinity.png",
              ),
              fit: BoxFit.cover,
            ),
          )),
      Container(
        margin: const EdgeInsets.only(top: 120),
        child: const Align(
          alignment: Alignment.topRight,
          child: Image(
            height: 250,
            image: AssetImage(
              "C:/Users/moski/Downloads/app/flutter_app/pic/cloud_sun.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 390),
        child: const Align(
          alignment: Alignment.topLeft,
          child: Image(
            height: 250,
            image: AssetImage(
              "C:/Users/moski/Downloads/app/flutter_app/pic/cloud.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
          margin: const EdgeInsets.only(top: 10),
          child: const Align(
            alignment: Alignment.center,
            child: Text("Hi, Welcome!\n",
                style: TextStyle(
                  fontSize: 30,
                  //fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 68, 68, 68),
                )),
          )),
      Container(
        margin: const EdgeInsets.only(top: 35),
        child: const Align(
            alignment: Alignment.center,
            child: Image(
              height: 30,
              image: AssetImage(
                  "C:/Users/moski/Downloads/app/flutter_app/pic/wave.png"),
              fit: BoxFit.cover,
            )),
      )
    ]));
  }
}
