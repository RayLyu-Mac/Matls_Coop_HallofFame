import 'package:coop_hall_of_fame/biomat/indi_detaio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'back.dart';
import 'decroation/boxfile.dart';

import 'manufact/manu_assemble.dart';

class home_p_s2 extends StatefulWidget {
  home_p_s2({Key? key}) : super(key: key);

  @override
  _home_p_s2State createState() => _home_p_s2State();
}

class _home_p_s2State extends State<home_p_s2> {
  double _screenWidth = 0;
  double _screenH = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenWidth = MediaQuery.of(context).size.width;
    _screenH = MediaQuery.of(context).size.height;
  }

  List<List> image_list1 = [
    [
      "ast/2.png",
      "Bio-Material",
      "Bio+Material=Future",
      "Go Bio",
      FontAwesomeIcons.biohazard,
      bio_page()
    ],
    [
      "ast/3.png",
      "Data & Computation",
      "Matls Student can also handle code!",
      "Go Code!",
      FontAwesomeIcons.laptopCode,
      bio_page()
    ],
    [
      "ast/1.png",
      "Research",
      "Explore research opportuinty in MSE",
      "Go Research!",
      FontAwesomeIcons.flask,
      bio_page(),
    ],
    [
      "ast/4.png",
      "Manufacturing",
      "Opportunity in manufacutring system",
      "Go Making!",
      FontAwesomeIcons.industry,
      manu_page()
    ],
    [
      "ast/5.png",
      "Smart Material",
      "Fancy Material",
      "Go Smart",
      FontAwesomeIcons.atom,
      bio_page()
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return backGroundPic(
      child: Column(
        children: [
          Column(
            children: [
              for (var index = 0; index < image_list1.length; index++)
                box_file(
                    img: image_list1[index][0],
                    height: _screenH / 4,
                    width: _screenWidth / 1.5,
                    content: image_list1[index][2],
                    labelName: image_list1[index][3],
                    pageto: image_list1[index][5],
                    buttonIcon: Icon(image_list1[index][4]),
                    title: image_list1[index][1])
            ],
          )
        ],
      ),
      pic: "ast/5.png",
      transp: 0.4,
    );
  }
}
