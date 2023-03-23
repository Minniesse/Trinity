import 'package:flutter/material.dart';
import 'camera.dart';

class global extends StatefulWidget {
  const global({super.key});

  @override
  State<global> createState() => _globalState();
}

class _globalState extends State<global> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
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
                          image: const DecorationImage(
                            image: AssetImage(
                              "C:/Users/moski/Downloads/app/flutter_app/pic/tri_card.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                              width: 1.25,
                              color: const Color.fromRGBO(255, 255, 255, 0.4)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(32)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              blurRadius: 4.0,
                              spreadRadius: 0.0,
                              offset: Offset(0.0, 3.0),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(30, 15, 0, 20),
                              alignment: Alignment.topLeft,
                              child: Image.asset(
                                "C:/Users/moski/Downloads/app/flutter_app/pic/Logo.png",
                                fit: BoxFit.cover,
                                // width: 68,
                                // height: 51,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(30, 0, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "TRI",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 24,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ],
    ));
  }
}
