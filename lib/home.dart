import 'package:coop_hall_of_fame/biomat/indi_detaio.dart';
import 'package:coop_hall_of_fame/computation/comp_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'back.dart';
import 'decroation/boxfile.dart';
import 'computation/comp_main.dart';
import 'Research/resmain.dart';
import 'package:coop_hall_of_fame/smartMat/smartassemble.dart';
import 'manufact/manu_assemble.dart';

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
  List<List> image_list1 = [
    [
      "ast/2.png",
      "Bio-Material",
      "Solving global health challenges by developing materials to diagnose and treat diseases",
      "Go Bio!",
      FontAwesomeIcons.biohazard,
      bio_page()
    ],
    [
      "ast/3.png",
      "Data & Computation",
      "Applying data analytics and machine learning algorithms to evaluate, improve, and discover materials",
      "Go Code!",
      FontAwesomeIcons.laptopCode,
      code_page()
    ],
  ];

  List<List> image_list2 = [
    [
      "ast/4.png",
      "Manufacturing",
      "Materials processing and research & development for infrastructure materials",
      "Go Making!",
      FontAwesomeIcons.industry,
      manu_page()
    ],
    [
      "ast/5.png",
      "Smart Material",
      "Tackling the world’s electrical challenges with smart multifunctional materials to accelerate solar, battery, and more technologies",
      "Go Smart!",
      FontAwesomeIcons.atom,
      smr_page()
    ],
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
            child: Container(
                height: _screenH * 1.2,
                width: _screenWidth / 20 * 18,
                margin: EdgeInsets.symmetric(
                    horizontal: _screenWidth / 20, vertical: _screenH / 20),
                decoration:
                    BoxDecoration(color: Colors.white10.withOpacity(0.9)),
                child: Stack(
                  children: [
                    Positioned(
                        top: _screenH / 25,
                        left: _screenWidth / 10,
                        child: Image(
                          fit: BoxFit.fitWidth,
                          height: _screenH / 13,
                          width: _screenWidth / 5,
                          image: NetworkImage(
                              "https://github.com/RayLyu-Mac/MMA_MaterialScienceEng/blob/main/assest/logocolor.png?raw=true"),
                        )),
                    Positioned(
                        left: _screenWidth / 10,
                        top: _screenH / 8,
                        child: Text(
                          "MATLS Co-op Hall of Fame",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _screenH / 15),
                        ))
                  ],
                )),
          ),
          Positioned(
            left: 0,
            top: _screenH / 3.5,
            child: Column(
              children: [
                for (var index = 0; index < image_list1.length; index++)
                  box_file(
                      img: image_list1[index][0],
                      height: _screenH / 1.7,
                      width: _screenWidth / 3.5,
                      content: image_list1[index][2],
                      labelName: image_list1[index][3],
                      pageto: image_list1[index][5],
                      buttonIcon: Icon(image_list1[index][4]),
                      title: image_list1[index][1])
              ],
            ),
          ),
          Positioned(
              left: _screenWidth / 3,
              top: _screenH / 2,
              child: box_file(
                  img: "ast/1.png",
                  buttonIcon: Icon(FontAwesomeIcons.flask),
                  labelName: "Go Research!",
                  pageto: res_page(),
                  height: _screenH / 1.7,
                  width: _screenWidth / 3,
                  content:
                      "Explore research opportuinty and make advancement in Science!",
                  title: "Research")),
          Positioned(
            left: _screenWidth / 1.4,
            top: _screenH / 3.5,
            child: Column(
              children: [
                for (var index = 0; index < image_list1.length; index++)
                  box_file(
                      img: image_list2[index][0],
                      height: _screenH / 1.7,
                      width: _screenWidth / 3.5,
                      content: image_list2[index][2],
                      labelName: image_list2[index][3],
                      pageto: image_list2[index][5],
                      buttonIcon: Icon(image_list2[index][4]),
                      title: image_list2[index][1])
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
