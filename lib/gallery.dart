import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'global.dart';
import 'package:camera/camera.dart';
import 'plant_recogniser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class gallery extends StatefulWidget {
  final String name;
  final CameraDescription? camera;
  const gallery({super.key, this.camera, required this.name});

  @override
  State<gallery> createState() => _GalleryState();
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

class _GalleryState extends State<gallery> {
  List<String> imagePaths = [];

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
    _loadImages();
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  Future<void> _loadImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> paths = prefs.getStringList('imagePaths') ?? [];
    print('Loaded image paths: $paths');
    setState(() {
      imagePaths = paths;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                //alignment: Alignment.bottomLeft,
                //color: Colors.orange,
                margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      //alignment: Alignment.center,
                      //color: Colors.green,
                      child: Image.asset(
                        "C:/Users/moski/Downloads/app/flutter_app/pic/Gallery_P.png",
                        height: MediaQuery.of(context).size.height * 0.04,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              padding: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width * 0.86,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    width: 2, color: const Color.fromRGBO(255, 255, 255, 1)),
                borderRadius: const BorderRadius.all(Radius.circular(19)),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 4.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 3.0),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(19)),
                child: Container(
                  padding: EdgeInsets.zero,
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: imagePaths.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Image.file(
                        File(imagePaths[index]),
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
                // width: MediaQuery.of(context).size.width * 0.93,
                // height: MediaQuery.of(context).size.height * 0.15,
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 37),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(45)),
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
                                  "C:/Users/moski/Downloads/app/flutter_app/pic/global_icon.png",
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
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
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: GestureDetector(
                                // onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => const gallery()),
                                //   );
                                // },
                                child: Image.asset(
                                  "C:/Users/moski/Downloads/app/flutter_app/pic/pictute_icon.png",
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
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
      ],
    ));
  }
}
