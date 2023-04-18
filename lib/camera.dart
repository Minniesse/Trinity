import 'global.dart';
import 'gallery.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TakePictureScreen extends StatefulWidget {
  final String name;
  const TakePictureScreen({
    Key? key,
    required this.camera,
    required this.name,
  }) : super(key: key);

  final CameraDescription? camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

Future<void> camera(String name) async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MaterialApp(
    home: TakePictureScreen(
      camera: firstCamera,
      name: name,
    ),
  ));
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  Future<String> _saveImageAndNavigate(XFile image) async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final String finalImagePath = join(appDir.path, '$imageName.jpg');

    await image.saveTo(finalImagePath);
    print('Image saved to: $finalImagePath');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> imagePaths = prefs.getStringList('imagePaths') ?? [];
    imagePaths.add(finalImagePath);
    await prefs.setStringList('imagePaths', imagePaths);

    return finalImagePath;
  }

  Future<void> _card(BuildContext context, String imagePath) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: FractionallySizedBox(
            widthFactor: MediaQuery.of(context).size.width / 475,
            heightFactor: 0.4,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(34),
              ),
              child: Container(
                color: const Color.fromRGBO(63, 63, 63, 1),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.18,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(34),
                        ),
                      ),
                      child: Image.file(
                        File(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _setFlashMode(FlashMode mode) async {
    if (_controller.value.flashMode == mode) {
      // If the requested mode is already set, do nothing.
      return;
    }
    try {
      await _controller.setFlashMode(mode);
    } on CameraException catch (e) {
      print('Error setting flash mode: ${e.description}');
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.camera != null) {
      _controller = CameraController(
        widget.camera!,
        ResolutionPreset.high,
        enableAudio: false,
      );
      _initializeControllerFuture = _controller.initialize();
    } else {
      // Handle the case when the camera is null, e.g., show an error message
      _initializeControllerFuture = Future.error('Camera not available');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "C:/Users/moski/Downloads/app/flutter_app/pic/Group 36697.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                //alignment: Alignment.center,
                //color: Colors.orange,
                margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      //color: Colors.green,
                      child: Image.asset(
                        "C:/Users/moski/Downloads/app/flutter_app/pic/small trinity.png",
                        height: MediaQuery.of(context).size.height * 0.045,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      alignment: Alignment.center,
                      //color: Colors.green,
                      child: Image.asset(
                        "C:/Users/moski/Downloads/app/flutter_app/pic/Tri_text.png",
                        height: MediaQuery.of(context).size.height * 0.035,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              width: MediaQuery.of(context).size.width * 0.86,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 28.0), // equal to half the button height
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: FutureBuilder<void>(
                        future: _initializeControllerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            // If the Future is complete, display the preview.
                            return FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.86,
                                height:
                                    MediaQuery.of(context).size.height * 0.7 -
                                        28, // minus half the button height
                                child: AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: CameraPreview(_controller),
                                ),
                              ),
                            );
                          } else {
                            // Otherwise, display a loading indicator.
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: (MediaQuery.of(context).size.width * 0.86) / 2 -
                        28, // half the button width
                    bottom: 0, // change this value
                    child: FloatingActionButton(
                      onPressed: () async {
                        await _setFlashMode(FlashMode.off);
                        await _initializeControllerFuture;
                        final image = await _controller.takePicture();
                        final imagePath = await _saveImageAndNavigate(image);
                        _card(context, imagePath);
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 7.0,
                      child: Image.asset(
                        'C:/Users/moski/Downloads/app/flutter_app/pic/camera_icon.png',
                        height: 56,
                        width: 56,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.93,
                height: MediaQuery.of(context).size.height * 0.15,
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 6, 40),
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
                              child: Image.asset(
                                "C:/Users/moski/Downloads/app/flutter_app/pic/home_icon.png",
                                height:
                                    MediaQuery.of(context).size.height * 0.045,
                                // width: 27.18,
                                // height: 28.37,
                                fit: BoxFit.contain,
                              ),
                            ),
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
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                  // width: 27.18,
                                  // height: 28.37,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                )),
          ],
        ),
      ],
    ));
  }
}
