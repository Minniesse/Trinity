import 'package:flutter/material.dart';
import 'Home.dart';

class Policy extends StatefulWidget {
  const Policy({Key? key}) : super(key: key);

  @override
  _PolicyState createState() => _PolicyState();
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
                        "C:/Users/moski/Downloads/app/flutter_app/pic/ppp.png",
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
                                "Lorem Ipsum",
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
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
