import 'package:flutter/material.dart';
import 'Privacy.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 90, 30, 0),
          child: Stack(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      margin: const EdgeInsets.fromLTRB(255, 0, 0, 0),
                      width: 40,
                      height: 40,
                      child: const Image(
                          image: AssetImage(
                              "C:/Users/moski/Downloads/app/flutter_app/pic/sun.png")),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
                      child: const Text(
                        "Trinity Card",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'SourceSansPro',
                            color: Color.fromARGB(255, 96, 96, 96)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  width: 400,
                  height: 175,
                  margin: const EdgeInsets.fromLTRB(0, 290, 0, 0),
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
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Maximum 16 Characters',
                          ),
                        ),
                      )
                    ],
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(220, 510, 0, 0),
                width: 90,
                height: 90,
                child: const Image(
                    image: AssetImage(
                        "C:/Users/moski/Downloads/app/flutter_app/pic/Glass_Drink.png")),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 520, 180, 0),
                child: const Align(
                    alignment: Alignment.center,
                    child: Image(
                      height: 90,
                      image: AssetImage(
                        "C:/Users/moski/Downloads/app/flutter_app/pic/Soda_Can.png",
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 150),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Policy()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(125, 54),
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
          ),
        ));
  }
}
