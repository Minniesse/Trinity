import 'package:flutter/material.dart';
// import 'package:flutter_app/camera.dart';
import 'Home.dart';
import 'package:camera/camera.dart';

import 'plant_recogniser.dart';

class Policy extends StatefulWidget {
  final CameraDescription? camera;
  final String name; // Add the name parameter

  const Policy({Key? key, this.camera, required this.name}) : super(key: key);

  @override
  _PolicyState createState() => _PolicyState();
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

class _PolicyState extends State<Policy> {
  //Scroll to down condition
  final ScrollController _scrollController = ScrollController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _isButtonEnabled = true;
      });
    }
  }

  //^^^^^^
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
          children: [
            Container(
              alignment: Alignment.center,
              //color: Colors.orange,
              margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.13,
              child: Stack(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Image.asset(
                        "pic/ppp.png",
                        width: MediaQuery.of(context).size.width * 0.37,
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.contain,
                      )),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.fromLTRB(0, 15, 50, 0),
                    child: Image.asset(
                        "C:/Users/moski/Downloads/app/flutter_app/pic/Untitled-1-final.png",
                        width: MediaQuery.of(context).size.width * 0.26,
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.contain),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              //color: Colors.orange,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Image.asset(
                        "C:/Users/moski/Downloads/app/flutter_app/pic/Group 36717.png",
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.7,
                        fit: BoxFit.fill),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(bottom: 0),
                            //color: Colors.blue,
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: const FittedBox(
                              child: Text(
                                "Privacy Policy\nLast updated: April 4, 2022",
                                style: TextStyle(
                                    color: Color.fromRGBO(70, 70, 70, 1),
                                    fontSize: 100,
                                    fontFamily: "SourceSansPro",
                                    fontWeight: FontWeight.w700),
                              ),
                            )),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          //color: Colors.orange,
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.height * 0.48,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            child: const Text(
                              "Trash Masters, as a mobile application, is made by Trinity and lets you take images of objects the user is going to discard to determine its recyclability. Due to the sensitive nature of the handled data, we would like to ensure that your data is as secure as possible.\n\nFollowing is an outline of the data we collect, how it is used, and your rights.\n\nData Collection And Use\nAccount Data\nWhen you enter the application, a username will need to be given via a prompt; this in combination with the device’s public unique identifier be used to keep track of each user’s images through the system. Additional information such as full names, email addresses, phone numbers, or other identifiers outside the ones listed will not need to be given and will not be asked of the user.\n\nPhotos\nEvery image taken by the user,if consent is provided, will be duplicated and transported back to our main database as further training data for our future models\nUsers have the ability to toggle their consent status by going to More > Data Sharing.\nChecking the box means that the user consents to the application saving and storing images given to it; these images will then be used as training data for future iterations of the ML model.\nNot / unchecking the option means that the user is no longer comfortable with sharing their images; this action ensures that future images taken on the application will not be duplicated and sent to our database as a data point. Furthermore, if the user has taken an image in the past and has just decided to disable data sharing, the images taken previous to this event will also be removed from the database. The process is possible thanks mostly to the UID key for each of the user’s devices.\nWe reserve the right to stochastically review and disable data sharing on devices that we deem suspicious of engaging in deliberate actions against the existing database; these actions include but are not limited to, distributed denial-of-service attacks, providing images that contain or hold the possibility of containing unlawful or violent behavior, etc.\n\nHow We Share Data\nWe do not sell, rent, license, or lease your data to third parties. However, we may share it with the following third parties:\nService Providers – such as hosting services, customer support services, and analytics services.\nProfessional Advisors – such as lawyers and accountants.\nLegal and Safety – government authorities or regulators or other third parties where required by law or legal process or to protect Trash Master’s, users’, or other third parties’ rights and safety.\n\nChanges to this Policy\nWe may need to update this policy to account for changes in our business and applicable laws. If we change this policy, we will post the new version here. If the changes are significant we will notify you through the app.",
                              style: TextStyle(
                                color: Color.fromRGBO(70, 70, 70, 1),
                                fontSize: 13,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              //color: Colors.orange,
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                          camera(widget.name).then((_) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlantRecogniser(
                                  camera: widget.camera,
                                  name: widget.name,
                                ),
                              ),
                            );
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width / 20, 53),
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
                  child: const FittedBox(
                    child: Text(
                      "Accept",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
