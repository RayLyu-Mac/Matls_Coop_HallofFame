import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'back.dart';
import 'decroation/boxfile.dart';
import 'biomat/bio_main.dart';

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
      "Bio+Material=Future",
      "Go Bio",
      FontAwesomeIcons.biohazard,
      bio_main()
    ],
    [
      "ast/3.png",
      "Data & Computation",
      "Matls Student can also handle code!",
      "Go Code!",
      FontAwesomeIcons.laptopCode,
      bio_main()
    ],
  ];

  List<List> image_list2 = [
    [
      "ast/4.png",
      "Manufacturing",
      "Opportunity in manufacutring system",
      "Go Making!",
      FontAwesomeIcons.industry,
      bio_main()
    ],
    [
      "ast/5.png",
      "Smart Material",
      "Fancy Material",
      "Go Smart",
      FontAwesomeIcons.atom,
      bio_main()
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
                          height: _screenH / 15,
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
                  pageto: bio_main(),
                  height: _screenH / 1.7,
                  width: _screenWidth / 3,
                  content: "Explore research opportuinty in MSE",
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
