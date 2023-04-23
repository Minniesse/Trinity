import 'package:flutter/material.dart';
import 'about_us.dart';
import 'package:camera/camera.dart';

class cmkl extends StatefulWidget {
  final String name;
  final CameraDescription? camera;
  const cmkl({super.key, this.camera, required this.name});

  @override
  State<cmkl> createState() => _cmklState();
}

class _cmklState extends State<cmkl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              camera(widget.name).then((_) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => about(
                            camera: widget.camera,
                            name: widget.name,
                          )),
                );
              });
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 330,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                border: Border.all(
                    width: 1, color: const Color.fromRGBO(224, 224, 224, 1)),
                image: const DecorationImage(
                  image: AssetImage(
                      'C:/Users/moski/Downloads/app/flutter_app/pic/cmkl.png'),
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 4.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 3.0),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            width: MediaQuery.of(context).size.width * 0.86,
            height: MediaQuery.of(context).size.height * 0.625,
            child: const SingleChildScrollView(
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam mi dolor, fringilla ac sodales sed, vehicula vitae velit. Curabitur sed pretium mauris, in pretium nulla. Nullam tincidunt at arcu eu lacinia. Phasellus in ligula elit. Nam varius pellentesque eros. Duis tristique sit amet neque in condimentum. Vivamus euismod blandit venenatis. Duis eu venenatis elit, a eleifend quam. Vestibulum nunc turpis, vulputate ut sodales nec, tempus sed mi. Vivamus risus enim, scelerisque vitae neque id, sollicitudin pharetra neque. Etiam pharetra cursus sem, eu faucibus nibh vehicula nec. Donec at metus nec tellus vehicula bibendum vel fermentum nisl. Duis faucibus ultricies hendrerit. Vestibulum vel lectus quis velit hendrerit scelerisque a vitae turpis. Nunc in erat sed dolor gravida aliquet. Donec posuere velit a viverra scelerisque. Aenean vestibulum neque et sapien tincidunt volutpat. Nullam volutpat nec magna vel malesuada. Maecenas vitae convallis felis. Curabitur felis dui, gravida vel facilisis quis, sodales in lacus. Nunc tristique, purus sit amet ullamcorper lobortis, sapien tellus scelerisque mauris, id viverra mi urna vel augue. Vivamus faucibus enim quam, sed aliquam enim pellentesque at. Donec et finibus lectus. Nulla ut vestibulum nibh. Aliquam porttitor felis ut sagittis feugiat. Suspendisse potenti. Curabitur sed lectus lectus. Sed tristique pretium urna, vel luctus arcu lobortis ut. Sed ultrices erat eu massa luctus sagittis. Aenean ut vulputate lacus, sit amet laoreet tortor. Donec tempor cursus auctor. Phasellus auctor mattis ipsum a porta. Pellentesque lobortis dapibus volutpat. Donec feugiat feugiat ex et euismod. Proin posuere sed purus quis iaculis. Curabitur volutpat sed tortor sed efficitur. Proin sed nibh nec lorem pharetra condimentum id non ipsum. Suspendisse nisl lorem, efficitur faucibus magna vitae, sodales tempus lacus. Vestibulum ut ullamcorper orci. Phasellus iaculis efficitur nunc, in ullamcorper erat vulputate ut. Aenean ac tellus eros. Nulla eu arcu et neque congue placerat. Nullam eget ex blandit, posuere nisl et, ornare lacus. Nunc hendrerit ultrices leo, a sagittis nisl dapibus consequat. Etiam viverra euismod justo, vel congue justo. Sed faucibus, metus eget molestie venenatis, mi turpis interdum mi, vel eleifend urna felis vel purus. Integer risus nisi, fringilla nec augue efficitur, consectetur convallis risus. Morbi scelerisque massa diam, a sodales dui aliquam in. Mauris sollicitudin nisl lectus, eget luctus elit vulputate sed. Duis volutpat velit purus, non cursus nisi elementum non. Aenean tincidunt consectetur libero, in ornare eros faucibus ut. Integer in rutrum magna. Proin nunc augue, sollicitudin at neque vitae, tempus hendrerit lectus. Ut eget felis in ex rutrum vehicula at in mi. Suspendisse orci neque, pulvinar at odio non, fringilla ornare velit. In quis ligula id tortor placerat faucibus eu sit amet turpis. Nullam nisl dolor, volutpat ac leo sed, condimentum pretium ligula. Curabitur pulvinar et diam nec dignissim.",
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
    );
  }
}
