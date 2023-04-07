import 'package:flutter/material.dart';
import 'package:flutter_app/about_apex.dart';
import 'package:flutter_app/about_cmkl.dart';
import 'package:flutter_app/about_trinity.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 65, 0, 0),
          width: double.infinity,
          height: 70,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "C:/Users/moski/Downloads/app/flutter_app/pic/Group 36722.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          height: 750,
          width: 351,
          //color: Colors.orange,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const our_Trinity()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: 319,
                    width: 351,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(224, 224, 224, 1)),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const apex()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    height: 319,
                    width: 351,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(224, 224, 224, 1)),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const cmkl()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    height: 319,
                    width: 351,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(224, 224, 224, 1)),
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
                child:
                    const Divider(color: Colors.black, thickness: 1, height: 1),
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
    ));
  }
}
