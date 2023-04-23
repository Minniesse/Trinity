import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/about_apex.dart';
import 'package:flutter_app/about_cmkl.dart';
import 'package:flutter_app/about_trinity.dart';
import 'package:flutter_app/global.dart';
import 'package:camera/camera.dart';
import 'plant_recogniser.dart';

class about extends StatefulWidget {
  final String name;
  final CameraDescription? camera;
  const about({super.key, this.camera, required this.name});

  @override
  State<about> createState() => _aboutState();
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

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Stack(children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                      width: double.infinity,
                      height: 70,
                      decoration: const BoxDecoration(
                        //color: Colors.orange,
                        image: DecorationImage(
                          image: AssetImage(
                              "C:/Users/moski/Downloads/app/flutter_app/pic/Group 36722.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 60, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          camera(widget.name).then((_) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => global(
                                        camera: widget.camera,
                                        name: widget.name,
                                      )),
                            );
                          });
                        },
                        child: Image.asset(
                          "pic/back.png",
                          height: MediaQuery.of(context).size.height * 0.035,
                          // width: 27.18,
                          // height: 28.37,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: MediaQuery.of(context).size.height * 0.809,
                  width: 351,
                  //color: Colors.orange,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            camera(widget.name).then((_) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => global(
                                          camera: widget.camera,
                                          name: widget.name,
                                        )),
                              );
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 319,
                            width: 351,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(224, 224, 224, 1)),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'C:/Users/moski/Downloads/app/flutter_app/pic/1stbanner.png'),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            camera(widget.name).then((_) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => apex(
                                          camera: widget.camera,
                                          name: widget.name,
                                        )),
                              );
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            height: 319,
                            width: 351,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(224, 224, 224, 1)),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'C:/Users/moski/Downloads/app/flutter_app/pic/apex.png'),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            camera(widget.name).then((_) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => cmkl(
                                          camera: widget.camera,
                                          name: widget.name,
                                        )),
                              );
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            height: 319,
                            width: 351,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(224, 224, 224, 1)),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'C:/Users/moski/Downloads/app/flutter_app/pic/cmkl.png'),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 124,
                          width: 351,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            // border: Border.all(
                            //     width: 1, color: const Color.fromRGBO(224, 224, 224, 1)),
                            image: const DecorationImage(
                              image: AssetImage(
                                  'C:/Users/moski/Downloads/app/flutter_app/pic/bk.png'),
                              fit: BoxFit.cover,
                            ),
                            //color: Colors.white,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                                //color: Colors.white,
                                width: 110,
                                child: Image.asset(
                                  "C:/Users/moski/Downloads/app/flutter_app/pic/Untitled-1-final.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 150,
                                child: Image.asset(
                                  "C:/Users/moski/Downloads/app/flutter_app/pic/triversion.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          )),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        width: 351,
                        height: 1,
                        color: Colors.black,
                        child: const Divider(
                            color: Colors.black, thickness: 1, height: 1),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: const Text("Privacy Policy",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
