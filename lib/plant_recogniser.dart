// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import '../classifier/classifier.dart';
import '../styles.dart';
import 'gallery.dart';
import 'global.dart';
import 'plant_photo_view.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const _labelsFileName = 'assets/labels.txt';
const _modelFileName = 'model_unquant.tflite';

class PlantRecogniser extends StatefulWidget {
  final String name;
  const PlantRecogniser({
    super.key,
    required this.name,
    required this.camera,
  });

  final CameraDescription? camera;

  @override
  State<PlantRecogniser> createState() => _PlantRecogniserState();
}

enum _ResultStatus {
  notStarted,
  notFound,
  found,
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

void _incrementCounter() async {
  // Reference to the Firestore document
  DocumentReference counterRef =
      FirebaseFirestore.instance.collection('counter').doc('clickCount');

  // Increment the 'count' field value by 1
  await counterRef.update({'count': FieldValue.increment(1)});
  print('Incremented click count');
}

class _PlantRecogniserState extends State<PlantRecogniser>
    with TickerProviderStateMixin {
  bool _isAnalyzing = false;
  final picker = ImagePicker();

  late AnimationController _slideController;
  late Animation<Offset> _originalContainerAnimation;
  late Animation<Offset> _newContainerAnimation;

  late CameraController _cameraController;
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

  Future<String> VariableforPredict(XFile image) async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final String finalImagePath = join(appDir.path, '$imageName.jpg');

    await image.saveTo(finalImagePath);
    print('Image saved to: $finalImagePath');

    return finalImagePath;
  }

  //for firebase that not sure
  Future<void> _uploadImage(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('images/$fileName');
      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() => print('Image uploaded successfully'));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  //for firebase that is plastic_F
  Future<void> _uploadImage_plastic_F(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('Wrong/Plastic_F/$fileName');
      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() => print('Image uploaded successfully'));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  //for firebase that is paper_F
  Future<void> _uploadImage_paper_F(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('Wrong/Paper_F/$fileName');
      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() => print('Image uploaded successfully'));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  //for firebase that is glass_F
  Future<void> _uploadImage_glass_F(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('Wrong/Glass_F/$fileName');
      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() => print('Image uploaded successfully'));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  //for firebase that is metal_F
  Future<void> _uploadImage_metal_F(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('Wrong/Metal_F/$fileName');
      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() => print('Image uploaded successfully'));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  //for firebase for not sure
  Future<void> _uploadImage_Others_F(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('Wrong/Others_F/$fileName');
      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() => print('Image uploaded successfully'));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  //for firebase that is plastic_T
  Future<void> _uploadImage_plastic_T(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('Correct/Plastic_T/$fileName');
      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() => print('Image uploaded successfully'));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  //for firebase that is paper_T
  Future<void> _uploadImage_paper_T(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('Correct/Paper_T/$fileName');
      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() => print('Image uploaded successfully'));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  //for firebase that is glass_T
  Future<void> _uploadImage_glass_T(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref =
          storage.ref().child('Correct/Glass_T/$fileName'); //glass_T
      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() => print('Image uploaded successfully'));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  //for firebase that is metal_T
  Future<void> _uploadImage_metal_T(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref =
          storage.ref().child('Correct/Metal_T/$fileName'); //glass_T
      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() => print('Image uploaded successfully'));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  //for firebase that is others_T
  Future<void> _uploadImage_Others_T(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref =
          storage.ref().child('Correct/Others_T/$fileName'); //glass_T
      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() => print('Image uploaded successfully'));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  //permissiontosendpicsetting
  Future<bool> _fetchButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('buttonEnabled') ?? true;
  }

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
    _loadClassifier();

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _originalContainerAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-5.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));

    _newContainerAnimation = Tween<Offset>(
      begin: const Offset(2.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));

    if (widget.camera != null) {
      _cameraController = CameraController(
        widget.camera!,
        ResolutionPreset.high,
        enableAudio: false,
      );
      _initializeControllerFuture = _cameraController.initialize();
    } else {
      // Handle the case when the camera is null, e.g., show an error message
      _initializeControllerFuture = Future.error('Camera not available');
    }
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  // Result
  _ResultStatus _resultStatus = _ResultStatus.notStarted;
  String _plantLabel = ''; // Name of Error Message
  double _accuracy = 0.0;

  late Classifier _classifier;

  @override
  void dispose() {
    _cameraController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  Future<void> _loadClassifier() async {
    debugPrint(
      'Start loading of Classifier with '
      'labels at $_labelsFileName, '
      'model at $_modelFileName',
    );

    final classifier = await Classifier.loadWith(
      labelsFileName: _labelsFileName,
      modelFileName: _modelFileName,
    );
    _classifier = classifier!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  //alignment: Alignment.center,
                  //color: Colors.orange,
                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        color: const Color.fromRGBO(255, 255, 255, 0.5),
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
                                    width: MediaQuery.of(context).size.width *
                                        0.86,
                                    height: MediaQuery.of(context).size.height *
                                            0.71 -
                                        28, // minus half the button height
                                    child: AspectRatio(
                                      aspectRatio:
                                          _cameraController.value.aspectRatio,
                                      child: CameraPreview(_cameraController),
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
                    ),
                    Positioned(
                      left: (MediaQuery.of(context).size.width * 0.86) / 2 -
                          28, // half the button width
                      bottom: 0, // change this value
                      child: GestureDetector(
                        onTap: () async {
                          await _initializeControllerFuture;
                          final image = await _cameraController.takePicture();
                          final imagePath = await VariableforPredict(image);
                          await _captureAndAnalyze(imagePath);
                          _incrementCounter();
                          //await _uploadImage(File(imagePath));
                        },
                        child: Container(
                          child: Image.asset(
                            'C:/Users/moski/Downloads/app/flutter_app/pic/camera_icon.png',
                            height: 56,
                            width: 56,
                          ),
                        ),
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
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
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
                                  height: MediaQuery.of(context).size.height *
                                      0.045,
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
              // const Spacer(),
              // Padding(
              //   padding: const EdgeInsets.only(top: 30),
              //   child: _buildTitle(),
              // ),
              // const SizedBox(height: 1),
              // // _buildPhotolView(),
              // const SizedBox(height: 0),
              // //_buildResultView(),
              // const Spacer(flex: 5),
              // _buildCaptureButton(),
              // const Spacer(),
            ])
      ]),
    );
  }

  Widget _buildPhotolView() {
    if (_cameraController == null || !_cameraController.value.isInitialized) {
      return const SizedBox.shrink();
    }
    return CameraPreview(_cameraController);
  }

  Widget _buildAnalyzingText() {
    if (!_isAnalyzing) {
      return const SizedBox.shrink();
    }
    return const Text('Analyzing...', style: kAnalyzingTextStyle);
  }

  Widget _buildTitle() {
    return const Text(
      'Trinity Model',
      style: kTitleTextStyle,
      textAlign: TextAlign.center,
    );
  }

  // Widget _buildCaptureButton() {
  //   return TextButton(
  //     onPressed: _captureAndAnalyze,
  //     child: Container(
  //       margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
  //       width: 300,
  //       height: 50,
  //       color: kColorBrown,
  //       child: Center(
  //           child: const Text(
  //         'Capture',
  //         style: TextStyle(
  //           fontFamily: kButtonFont,
  //           fontSize: 20.0,
  //           fontWeight: FontWeight.w600,
  //           color: kColorLightYellow,
  //         ),
  //       )),
  //     ),
  //   );
  // }

  Future<void> _captureAndAnalyze(String imagePath) async {
    if (_cameraController == null || !_cameraController.value.isInitialized) {
      return;
    }

    _setAnalyzing(true);

    final image = await _cameraController.takePicture();
    final imageFile = File(image.path);

    setState(() {});

    final imageInput = img.decodeImage(imageFile.readAsBytesSync())!;
    final resultCategory = _classifier.predict(imageInput);

    final result = resultCategory.score >= 0.8
        ? _ResultStatus.found
        : _ResultStatus.notFound;
    final plantLabel = resultCategory.label;
    final accuracy = resultCategory.score;

    _setAnalyzing(false);

    setState(() {
      _resultStatus = result;
      _plantLabel = plantLabel;
      _accuracy = accuracy;
    });
    var title = '';
    title = _plantLabel;
    var accuracyLabel = '';
    accuracyLabel = 'Accuracy\n${(_accuracy * 100).toStringAsFixed(2)}%';

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: _originalContainerAnimation,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.87,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(34),
                      ),
                      child: Container(
                        color: const Color.fromARGB(255, 66, 66, 66),
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
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
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(290, 20, 0, 0),
                                  width: 40,
                                  height: 40,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset("pic/close_but.png"),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  //crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              30, 35, 0, 0),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            title,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: "SFpro",
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        // Container(
                                        //   margin: EdgeInsets.fromLTRB(30, 5, 0, 0),
                                        //   alignment: Alignment.topLeft,
                                        //   child: Text(
                                        //     "Accuracy",
                                        //     style: TextStyle(
                                        //         color: Color.fromRGBO(173, 173, 179, 1),
                                        //         fontFamily: "SFpro",
                                        //         fontSize: 20,
                                        //         fontWeight: FontWeight.w500),
                                        //   ),
                                        // ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              30, 0, 0, 0),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            accuracyLabel,
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    173, 173, 179, 1),
                                                fontFamily: "SFpro",
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 10, 0),
                                          child: GestureDetector(
                                            onTap: () {
                                              _slideController.forward();
                                            },
                                            child: Image.asset(
                                              "pic/wrong_but.png",
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 30, 0),
                                          //alignment: Alignment.topRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              _fetchButtonState()
                                                  .then((buttonEnabled) async {
                                                if (buttonEnabled) {
                                                  bool isPlastic =
                                                      title == "Plastic";
                                                  bool isPaper =
                                                      title == "Paper";
                                                  bool isGlass =
                                                      title == "Glass";
                                                  bool isMetal =
                                                      title == "Metal";
                                                  bool isOthers = title ==
                                                      "Ceramics"
                                                          "Kitchenware"
                                                          "Light bulb"
                                                          "Photographs"
                                                          "Styrofoams"
                                                          "Wood";
                                                  if (isPlastic) {
                                                    Navigator.pop(context);
                                                    await _initializeControllerFuture;
                                                    final image =
                                                        await _cameraController
                                                            .takePicture();
                                                    final imagePath =
                                                        await _saveImageAndNavigate(
                                                            image);
                                                    await _uploadImage_plastic_T(
                                                        File(imagePath));
                                                    debugPrint(
                                                        "success upload");
                                                  }
                                                  if (isPaper) {
                                                    Navigator.pop(context);
                                                    await _initializeControllerFuture;
                                                    final image =
                                                        await _cameraController
                                                            .takePicture();
                                                    final imagePath =
                                                        await _saveImageAndNavigate(
                                                            image);
                                                    await _uploadImage_paper_T(
                                                        File(imagePath));
                                                    debugPrint(
                                                        "success upload");
                                                  }
                                                  if (isGlass) {
                                                    Navigator.pop(context);
                                                    await _initializeControllerFuture;
                                                    final image =
                                                        await _cameraController
                                                            .takePicture();
                                                    final imagePath =
                                                        await _saveImageAndNavigate(
                                                            image);
                                                    await _uploadImage_glass_T(
                                                        File(imagePath));
                                                    debugPrint(
                                                        "success upload");
                                                  }
                                                  if (isMetal) {
                                                    Navigator.pop(context);
                                                    await _initializeControllerFuture;
                                                    final image =
                                                        await _cameraController
                                                            .takePicture();
                                                    final imagePath =
                                                        await _saveImageAndNavigate(
                                                            image);
                                                    await _uploadImage_metal_T(
                                                        File(imagePath));
                                                    debugPrint(
                                                        "success upload");
                                                  }
                                                  if (isOthers) {
                                                    Navigator.pop(context);
                                                    await _initializeControllerFuture;
                                                    final image =
                                                        await _cameraController
                                                            .takePicture();
                                                    final imagePath =
                                                        await _saveImageAndNavigate(
                                                            image);
                                                    await _uploadImage_Others_T(
                                                        File(imagePath));
                                                    debugPrint(
                                                        "success upload");
                                                  } else {
                                                    debugPrint("error");
                                                    debugPrint(_plantLabel);
                                                  }
                                                } else {
                                                  Navigator.pop(context);
                                                  await _initializeControllerFuture;
                                                  final image =
                                                      await _cameraController
                                                          .takePicture();
                                                  final imagePath =
                                                      await _saveImageAndNavigate(
                                                          image);
                                                  debugPrint("button disabled");
                                                }
                                              });
                                            },
                                            child: Image.asset(
                                              "pic/cor_but.png",
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              // width: 27.18,
                                              // height: 28.37,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: const Divider(
                                        color: Color.fromRGBO(89, 89, 92, 1),
                                        thickness: 1,
                                        height: 1),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      child: Image.asset(
                                        "C:/Users/moski/Downloads/app/flutter_app/pic/Tri_ai.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                "Powered by",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        151, 151, 151, 1),
                                                    fontFamily: "SFpro",
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 0, 0),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                "Trinity AI",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontFamily: "SFpro",
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        )),
                                    Expanded(
                                        child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 25, 0),
                                      alignment: Alignment.centerRight,
                                      //color: Colors.orange,
                                      child: const Text("Learn More>",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  151, 151, 151, 1),
                                              fontFamily: "SFpro",
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500)),
                                    )),
                                  ]),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: _newContainerAnimation,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.87,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(34),
                      ),
                      child: Container(
                        color: const Color.fromRGBO(238, 238, 238, 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(30, 40, 0, 0),
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: const FittedBox(
                                  child: Text(
                                    "We’re sorry\nto hear that.",
                                    style: TextStyle(
                                        color: Color.fromRGBO(101, 101, 101, 1),
                                        fontFamily: "SFpro",
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                        height: 1.1),
                                  ),
                                )),
                            Container(
                              margin: const EdgeInsets.fromLTRB(30, 6, 0, 0),
                              child: const Text(
                                "Could you give me the suggestions?",
                                style: TextStyle(
                                    color: Color.fromRGBO(33, 33, 33, 1),
                                    fontFamily: "SFpro",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Center(
                              child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  alignment: Alignment.center,
                                  height: 38,
                                  width:
                                      MediaQuery.of(context).size.width * 0.72,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(26),
                                    border: Border.all(
                                      color: const Color(0xffe09007),
                                      width: 2.14,
                                    ),
                                  ),
                                  child: GestureDetector(
                                      onTap: () {
                                        _fetchButtonState()
                                            .then((buttonEnabled) async {
                                          Navigator.pop(context);
                                          await _initializeControllerFuture;
                                          final image = await _cameraController
                                              .takePicture();
                                          final imagePath =
                                              await _saveImageAndNavigate(
                                                  image);
                                          if (buttonEnabled) {
                                            await _uploadImage_Others_F(
                                                File(imagePath));
                                            debugPrint(
                                                "Upload to Other_F done!");
                                          }
                                        });
                                      },
                                      child: const Text("I'm not sure",
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(175, 105, 0, 1),
                                            fontFamily: "Inter",
                                            fontSize: 20,
                                          )))),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        alignment: Alignment.center,
                                        height: 38,
                                        width: 136,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(26),
                                          border: Border.all(
                                            color: const Color(0xffe09007),
                                            width: 2.14,
                                          ),
                                        ),
                                        child: GestureDetector(
                                            onTap: () {
                                              _fetchButtonState()
                                                  .then((buttonEnabled) async {
                                                Navigator.pop(context);
                                                await _initializeControllerFuture;
                                                final image =
                                                    await _cameraController
                                                        .takePicture();
                                                final imagePath =
                                                    await _saveImageAndNavigate(
                                                        image);
                                                if (buttonEnabled) {
                                                  await _uploadImage_plastic_F(
                                                      File(imagePath));
                                                  debugPrint(
                                                      "Upload to Plastic_F done!");
                                                }
                                              });
                                            },
                                            child: const Text("Plastic",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      175, 105, 0, 1),
                                                  fontFamily: "Inter",
                                                  fontSize: 20,
                                                )))),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        alignment: Alignment.center,
                                        height: 38,
                                        width: 136,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(26),
                                          border: Border.all(
                                            color: const Color(0xffe09007),
                                            width: 2.14,
                                          ),
                                        ),
                                        child: GestureDetector(
                                            onTap: () {
                                              _fetchButtonState()
                                                  .then((buttonEnabled) async {
                                                Navigator.pop(context);
                                                await _initializeControllerFuture;
                                                final image =
                                                    await _cameraController
                                                        .takePicture();
                                                final imagePath =
                                                    await _saveImageAndNavigate(
                                                        image);
                                                if (buttonEnabled) {
                                                  await _uploadImage_paper_F(
                                                      File(imagePath));
                                                  debugPrint(
                                                      "Upload to paper_F done!");
                                                }
                                              });
                                            },
                                            child: const Text("Paper",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      175, 105, 0, 1),
                                                  fontFamily: "Inter",
                                                  fontSize: 20,
                                                )))),
                                  ]),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        alignment: Alignment.center,
                                        height: 38,
                                        width: 136,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(26),
                                          border: Border.all(
                                            color: const Color(0xffe09007),
                                            width: 2.14,
                                          ),
                                        ),
                                        child: GestureDetector(
                                            onTap: () {
                                              _fetchButtonState()
                                                  .then((buttonEnabled) async {
                                                Navigator.pop(context);
                                                await _initializeControllerFuture;
                                                final image =
                                                    await _cameraController
                                                        .takePicture();
                                                final imagePath =
                                                    await _saveImageAndNavigate(
                                                        image);
                                                if (buttonEnabled) {
                                                  await _uploadImage_metal_F(
                                                      File(imagePath));
                                                  debugPrint(
                                                      "Upload to metal_F done!");
                                                }
                                              });
                                            },
                                            child: const Text("Metal",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      175, 105, 0, 1),
                                                  fontFamily: "Inter",
                                                  fontSize: 20,
                                                )))),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        alignment: Alignment.center,
                                        height: 38,
                                        width: 136,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(26),
                                          border: Border.all(
                                            color: const Color(0xffe09007),
                                            width: 2.14,
                                          ),
                                        ),
                                        child: GestureDetector(
                                            onTap: () {
                                              _fetchButtonState()
                                                  .then((buttonEnabled) async {
                                                Navigator.pop(context);
                                                await _initializeControllerFuture;
                                                final image =
                                                    await _cameraController
                                                        .takePicture();
                                                final imagePath =
                                                    await _saveImageAndNavigate(
                                                        image);
                                                if (buttonEnabled) {
                                                  await _uploadImage_glass_F(
                                                      File(imagePath));
                                                  debugPrint(
                                                      "Upload to glass_F done!");
                                                }
                                              });
                                            },
                                            child: const Text("Glass",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      175, 105, 0, 1),
                                                  fontFamily: "Inter",
                                                  fontSize: 20,
                                                )))),
                                  ]),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () async {
                                    _slideController.reverse();
                                  },
                                  child: Image.asset(
                                    "pic/reverse_but.png",
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ), // Replace this with your new container
              ),
            ),
          ],
        );
      },
    ).whenComplete(() {
      _slideController.reverse();
    });
  }

  void _setAnalyzing(bool flag) {
    setState(() {
      _isAnalyzing = flag;
    });
  }

  void _onPickPhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) {
      return;
    }

    final imageFile = File(pickedFile.path);
    setState(() {});

    _analyzeImage(imageFile);
  }

  void _analyzeImage(File image) {
    _setAnalyzing(true);

    final imageInput = img.decodeImage(image.readAsBytesSync())!;

    final resultCategory = _classifier.predict(imageInput);

    final result = resultCategory.score >= 0.8
        ? _ResultStatus.found
        : _ResultStatus.notFound;
    final plantLabel = resultCategory.label;
    final accuracy = resultCategory.score;

    _setAnalyzing(false);

    setState(() {
      _resultStatus = result;
      _plantLabel = plantLabel;
      _accuracy = accuracy;
    });
  }

  Widget _buildResultView() {
    var title = '';

    //if (_resultStatus == _ResultStatus.found) {
    title = _plantLabel;
    //}
    //else {
    //   title = '';
    // }

    //
    var accuracyLabel = '';
    if (_resultStatus == _ResultStatus.found) {
      accuracyLabel = 'Accuracy: ${(_accuracy * 100).toStringAsFixed(2)}%';
    } else {
      accuracyLabel = 'Accuracy: ${(_accuracy * 100).toStringAsFixed(2)}%';
    }

    return Column(
      children: [Text(title), const SizedBox(height: 10), Text(accuracyLabel)],
    );
  }
}
