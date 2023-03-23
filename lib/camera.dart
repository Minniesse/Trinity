import 'package:flutter/material.dart';
import 'global.dart';
import 'gallery.dart';

class camera extends StatefulWidget {
  const camera({super.key});

  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {
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
                alignment: Alignment.center,
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
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              //width: 353,
              width: MediaQuery.of(context).size.width * 0.86,
              //height: 573,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                      'C:/Users/moski/Downloads/app/flutter_app/pic/demo_pic.png'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                    width: 2, color: const Color.fromRGBO(216, 218, 220, 0.7)),
                borderRadius: const BorderRadius.all(Radius.circular(26)),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const global()),
                                  );
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const gallery()),
                                  );
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
