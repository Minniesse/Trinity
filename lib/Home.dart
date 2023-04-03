import 'package:flutter/material.dart';
import 'Privacy.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //name
  var _name;
  final _nameController = TextEditingController();
  //button
  bool submit = false;

  //Preload images (next page)
  Future<void> _preloadImages(BuildContext context) async {
    final imagePaths = [
      'C:/Users/moski/Downloads/app/flutter_app/pic/Group 36697.png',
      'C:/Users/moski/Downloads/app/flutter_app/pic/Group 36717.png',
      // 'assets/image3.png',
      // 'assets/image4.png',
      // 'assets/image5.png',
      // Add more image paths as necessary
    ];
    for (final imagePath in imagePaths) {
      await precacheImage(Image.asset(imagePath).image, context);
    }
  }

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      _updatename();
      setState(() {
        submit = _nameController.text.isNotEmpty; //button
      });
    });
  }

  //void name
  void _updatename() {
    setState(() {
      _name = _nameController.text; //name
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
            constraints: const BoxConstraints.expand(),
            width: MediaQuery.of(context).size.width * 5,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "C:/Users/moski/Downloads/app/flutter_app/pic/homebk.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 90, 30, 0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                  height: 220.0,
                  width: 362.0,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.70),
                          Color.fromRGBO(255, 255, 255, 0.70)
                        ]),
                    border: Border.all(
                      width: 1.25,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(32)),
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
                        margin: const EdgeInsets.fromLTRB(25, 5, 0, 20),
                        width: 70,
                        height: 70,
                        child: const Image(
                            image: AssetImage(
                                "C:/Users/moski/Downloads/app/flutter_app/pic/Logo.png")),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(270, 95, 0, 0),
                        width: 40,
                        height: 40,
                        child: const Image(
                            image: AssetImage(
                                "C:/Users/moski/Downloads/app/flutter_app/pic/sun.png")),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(25, 100, 0, 0),
                        child: Text(
                          (_nameController.text),
                          style: const TextStyle(
                              fontSize: 22,
                              fontFamily: 'SourceSansPro',
                              color: Color.fromRGBO(68, 68, 68, 1)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(25, 165, 0, 0),
                        child: const Text(
                          "Trinity Card",
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'SourceSansPro',
                              color: Color.fromRGBO(68, 68, 68, 1)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    width: 362,
                    height: 175,
                    //height: MediaQuery.of(context).size.height * 0.22,
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(216, 218, 220, 1),
                          width: 1.5,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: const Text(
                              "Enter Your Name",
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Color.fromARGB(255, 69, 69, 69),
                              ),
                            )),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            child: TextFormField(
                              maxLength: 16,
                              controller: _nameController,
                              style: const TextStyle(
                                  // fontSize: 22,
                                  fontFamily: 'Poppins',
                                  color: Color.fromARGB(255, 69, 69, 69)),
                              decoration: const InputDecoration(
                                counterText:
                                    '', //remove counter (hidden the character remaining)
                                border: UnderlineInputBorder(),
                                labelText: 'Maximum 16 Characters',
                              ),
                            )),
                      ],
                    )),
                Container(
                    //color: Colors.orange,
                    child: Stack(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(230, 20, 0, 0),
                        child: Image.asset(
                          "C:/Users/moski/Downloads/app/flutter_app/pic/Glass_Drink.png",
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.12,
                          fit: BoxFit.contain,
                        )),
                    Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(0, 120, 240, 0),
                        child: Image.asset(
                          "C:/Users/moski/Downloads/app/flutter_app/pic/Soda_Can.png",
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          fit: BoxFit.contain,
                        )),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          //submit see the 16th line
                          child: ElevatedButton(
                            onPressed: submit
                                ? () {
                                    _preloadImages(context).then((_) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Policy(
                                                  name: _nameController.text)));
                                    });
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width / 3,
                                  MediaQuery.of(context).size.height / 17),
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
                            child: const Text("Next",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                )),
                          ),
                        )),
                  ],
                )),
              ],
            ),
          )
        ]));
  }
}
