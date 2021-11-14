import 'package:flutter/material.dart';
import 'back.dart';

class home_page extends StatefulWidget {
  home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  double _screenWidth = 0;
  double _screenH = 0;
  List<String> image_list = [
    "ast/2.png",
    "ast/3.png",
    "ast/4.png",
    "ast/5.png"
  ];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenWidth = MediaQuery.of(context).size.width;
    _screenH = MediaQuery.of(context).size.height;
    print(_screenH);
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
              top: _screenH / 10,
              left: _screenWidth / 10,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: _screenWidth / 20, vertical: _screenH / 20),
                decoration:
                    BoxDecoration(color: Colors.white10.withOpacity(0.9)),
                child: Column(
                  children: [Text("MATLS Coop Hall of Fame")],
                ),
              ))
        ],
      ),
      pic: "ast/5.png",
      transp: 0.4,
    ));
  }
}
