import 'package:flutter/material.dart';
import 'Home.dart';

class Policy extends StatefulWidget {
  const Policy({super.key});

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
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
      Container(
        margin: const EdgeInsets.only(top: 30),
        child: const Align(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage(
                "C:/Users/moski/Downloads/app/flutter_app/pic/Group 36717.png",
              ),
              fit: BoxFit.cover,
            )),
      ),
      Container(
          margin: const EdgeInsets.fromLTRB(250, 85, 0, 0),
          child: const Align(
            alignment: Alignment.topLeft,
            child: Image(
              image: AssetImage(
                "C:/Users/moski/Downloads/app/flutter_app/pic/Untitled-1-final.png",
              ),
              fit: BoxFit.cover,
            ),
          )),
      Container(
          margin: const EdgeInsets.fromLTRB(41, 75, 0, 0),
          child: const Align(
            alignment: Alignment.topLeft,
            child: Image(
              image: AssetImage(
                "C:/Users/moski/Downloads/app/flutter_app/pic/ppp.png",
              ),
              fit: BoxFit.cover,
            ),
          )),
      Container(
        padding: const EdgeInsets.all(45),
        margin: const EdgeInsets.fromLTRB(9, 145, 0, 0),
        child: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Lorem Ipsum",
            style: TextStyle(
                color: Color.fromRGBO(70, 70, 70, 1),
                fontSize: 27,
                fontFamily: "SourceSansPro",
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 480,
        padding: const EdgeInsets.all(50),
        margin: const EdgeInsets.fromLTRB(6, 180, 0, 0),
        child: const Align(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mattis mi quis fringilla blandit. Quisque accumsan vitae eros ac iaculis. Sed massa leo, egestas vel ultricies non, ullamcorper facilisis odio. Suspendisse rutrum purus ut orci facilisis, a venenatis leo pharetra. Nulla orci arcu, vulputate in mauris at, ullamcorper condimentum nisi. Fusce nec diam lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc laoreet est ut felis consectetur, eget fringilla massa fermentum. Nulla tempus nec ipsum eu scelerisque. Sed ultrices sapien ut est bibendum efficitur. Sed eu accumsan felis. Proin sit amet pulvinar odio, ut egestas erat. Curabitur blandit id elit vel mattis. Nullam ipsum augue, lobortis sit amet pellentesque et, suscipit non velit. Curabitur pretium sapien augue, eget lacinia diam aliquam elementum. Nullam auctor urna nisl, quis auctor massa sodales id. Vivamus ut ligula vel nulla rhoncus condimentum ac eget orci. Sed mollis dui a sem maximus tristique. Phasellus eleifend libero a aliquet aliquet. Donec aliquam est vel lorem sollicitudin sagittis. Nullam tellus magna, porta ac leo ut, dignissim semper ligula. Sed ullamcorper, turpis et luctus egestas, mi nisl rhoncus sapien, vehicula pulvinar lacus lectus ac odio. Nam laoreet mi eget eros ullamcorper molestie. Donec suscipit sapien lacus, quis vehicula sem fermentum ut. Etiam vehicula blandit risus quis mollis. Morbi blandit, lacus at convallis rhoncus, urna velit imperdiet velit, id euismod metus ipsum vel arcu. Proin dignissim ipsum a sem laoreet consequat. Aliquam finibus nisl non est pharetra vulputate. Quisque ac nunc nisl. Etiam in consectetur justo.",
                style: TextStyle(
                    color: Color.fromRGBO(70, 70, 70, 1),
                    fontSize: 13,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.w700),
              ),
            )),
      ),
      Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 70),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
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
    ]));
  }
}
