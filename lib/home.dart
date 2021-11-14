import 'package:flutter/material.dart';
import 'back.dart';
import 'decroation/boxfile.dart';

class home_page extends StatefulWidget {
  home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  double _screenWidth = 0;
  double _screenH = 0;
  bool _hovering1 = false;

  ScrollController sidem = ScrollController();
  ScrollController midm = ScrollController();
  List<String> image_list1 = [
    "ast/2.png",
    "ast/3.png",
  ];

  List<String> image_list2 = [
    "ast/4.png",
    "ast/5.png",
  ];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenWidth = MediaQuery.of(context).size.width;
    _screenH = MediaQuery.of(context).size.height;
  }

  void _mouseEnter1(bool hover1) {
    setState(() {
      _hovering1 = hover1;
    });
  }

  @override
  Widget build(BuildContext context) {
    List Poslist = [
      [0, 0],
      [0, _screenWidth / 2],
      [_screenH / 2, 0],
      [_screenH / 2, _screenWidth / 2]
    ];

    return Scaffold(
        body: backGroundPic(
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: SingleChildScrollView(
                controller: midm,
                child: Container(
                  height: _screenH / 1.05,
                  width: _screenWidth / 20 * 18,
                  margin: EdgeInsets.symmetric(
                      horizontal: _screenWidth / 20, vertical: _screenH / 20),
                  decoration:
                      BoxDecoration(color: Colors.white10.withOpacity(0.9)),
                  child: Column(
                    children: [Text("MATLS Coop Hall of Fame")],
                  ),
                ),
              )),
          Positioned(
            left: 0,
            top: _screenH / 6.5,
            child: Column(
              children: [
                for (var index = 0; index < image_list1.length; index++)
                  Container(
                    height: _screenH / 2.5,
                    width: _screenWidth / 3.5,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(image_list1[index]))),
                  )
              ],
            ),
          ),
          Positioned(
            left: _screenWidth / 1.4,
            top: _screenH / 6.5,
            child: Column(
              children: [
                for (var index = 0; index < image_list1.length; index++)
                  Container(
                    height: _screenH / 2.5,
                    width: _screenWidth / 3.5,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(image_list2[index]))),
                  )
              ],
            ),
          ),
        ],
      ),
      pic: "ast/5.png",
      transp: 0.4,
    ));
  }
}
