import 'package:flutter/material.dart';
import 'gallery.dart';
import 'camera.dart';
import 'package:camera/camera.dart';
import 'plant_recogniser.dart';

class global extends StatefulWidget {
  final String name;
  final CameraDescription? camera;
  const global({super.key, this.camera, required this.name});

  @override
  State<global> createState() => _globalState();
}

Future<void> camera(String name) async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MaterialApp(
    home: PlantRecogniser(
      camera: firstCamera,
      name: name,
    ),
  ));
}

class _globalState extends State<global> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(230, 230, 230, 1),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            //width: double.infinity,
            //height: MediaQuery.of(context).size.height * 0.3,
            //color: Colors.orange,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Container(
                          width: 362,
                          height: 232,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment(3, -3),
                                end: Alignment(1, -4.8),
                                colors: [
                                  Color.fromRGBO(218, 188, 255, 1),
                                  Color.fromRGBO(234, 243, 252, 1)
                                ]),
                            border: Border.all(
                              width: 1.25,
                              color: const Color.fromRGBO(255, 255, 255, 0.4),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(32)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.2),
                                blurRadius: 4.0,
                                spreadRadius: 0.0,
                                offset: Offset(0.0, 4.0),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(30, 15, 0, 20),
                                alignment: Alignment.topLeft,
                                child: Image.asset(
                                  "C:/Users/moski/Downloads/app/flutter_app/pic/Logo.png",
                                  fit: BoxFit.cover,
                                  // width: 68,
                                  // height: 51,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(30, 10, 0, 0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.name,
                                      style: const TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 24,
                                          color: Color.fromRGBO(68, 68, 68, 1)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: double.infinity,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 10, 40, 0),
                                    alignment: Alignment.centerRight,
                                    width: 40,
                                    height: 40,
                                    child: const Image(
                                        image: AssetImage(
                                            "C:/Users/moski/Downloads/app/flutter_app/pic/sun.png")),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(30, 0, 0, 25),
                                alignment: Alignment.bottomLeft,
                                child: const Text(
                                  "Trinity Card",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'SourceSansPro',
                                      color: Color.fromRGBO(68, 68, 68, 1)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: 362,
            height: MediaQuery.of(context).size.height * 0.17,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'C:/Users/moski/Downloads/app/flutter_app/pic/image 297.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(32)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 4.0),
                ),
              ],
            ),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 15, 0, 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Trash Master\nhas scanned\nfor",
                    style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'SFpro',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 65, 20),
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    "273",
                    style: TextStyle(
                      fontSize: 70,
                      fontFamily: 'SFpro',
                      color: Color.fromRGBO(29, 143, 0, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 30),
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    "Junks",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SFpro',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: 362,
            height: 212,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment(3, -3),
                  end: Alignment(1, -4.8),
                  colors: [
                    Color.fromRGBO(217, 162, 227, 1),
                    Color.fromRGBO(252, 241, 195, 1),
                  ]),
              borderRadius: BorderRadius.circular(32),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 4.0),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 25, 0, 0),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "More",
                    style: TextStyle(
                        fontSize: 27,
                        fontFamily: 'SFpro',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 15, 0, 0),
                  child: Row(
                    children: [
                      Container(
                        width: 47,
                        height: 47,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(224, 224, 224, 1)),
                            image: const DecorationImage(
                              image: AssetImage(
                                  'C:/Users/moski/Downloads/app/flutter_app/pic/funfueng.png'),
                              fit: BoxFit.contain,
                            ),
                            color: Colors.white),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 0, 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Settings",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: 'SFpro',
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "Set the color theme, set the region",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'SFpro',
                                    //fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(102, 102, 102, 1)),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 15, 0, 0),
                  child: Row(
                    children: [
                      Container(
                        width: 47,
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromRGBO(224, 224, 224, 1)),
                          image: const DecorationImage(
                            image: AssetImage(
                                'C:/Users/moski/Downloads/app/flutter_app/pic/human.png'),
                            fit: BoxFit.contain,
                          ),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 0, 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "About us",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: 'SFpro',
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "Our story and our objectives and contacts.",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'SFpro',
                                    //fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(102, 102, 102, 1)),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              // width: MediaQuery.of(context).size.width * 0.93,
              // height: MediaQuery.of(context).size.height * 0.15,
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 6, 20),
                    width: 375,
                    height: 89.29,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                            'C:/Users/moski/Downloads/app/flutter_app/pic/navigator.png'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                          width: 2,
                          color: const Color.fromRGBO(255, 255, 255, 0.7)),
                      borderRadius: const BorderRadius.all(Radius.circular(45)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                          offset: Offset(0.0, 3.0),
                        ),
                      ],
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          global(name: widget.name)),
                                );
                              },
                              child: Image.asset(
                                "C:/Users/moski/Downloads/app/flutter_app/pic/global_icon.png",
                                height:
                                    MediaQuery.of(context).size.height * 0.035,
                                // width: 27.18,
                                // height: 28.37,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: GestureDetector(
                                onTap: () {
                                  camera(widget.name).then((_) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlantRecogniser(
                                                camera: widget.camera,
                                                name: widget.name,
                                              )),
                                    );
                                  });
                                },
                                child: Image.asset(
                                  "C:/Users/moski/Downloads/app/flutter_app/pic/home_icon.png",
                                  height: MediaQuery.of(context).size.height *
                                      0.045,
                                  // width: 27.18,
                                  // height: 28.37,
                                  fit: BoxFit.contain,
                                ),
                              )),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: GestureDetector(
                              onTap: () {
                                camera(widget.name).then((_) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => gallery(
                                              camera: widget.camera,
                                              name: widget.name,
                                            )),
                                  );
                                });
                              },
                              child: Image.asset(
                                "C:/Users/moski/Downloads/app/flutter_app/pic/pictute_icon.png",
                                height:
                                    MediaQuery.of(context).size.height * 0.035,
                                // width: 27.18,
                                // height: 28.37,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ]),
                    // child: Image.asset(
                    //   "C:/Users/moski/Downloads/app/flutter_app/pic/navigator.png",
                    //   height: MediaQuery.of(context).size.height * 0.15,
                    //   fit: BoxFit.contain,
                    // ),
                  ),
                ],
              )),
        ],
      )
    ]));
  }
}
