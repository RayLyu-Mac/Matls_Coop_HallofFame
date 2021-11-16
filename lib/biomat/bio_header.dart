import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:coop_hall_of_fame/header.dart';
import 'package:coop_hall_of_fame/home.dart';
import 'package:coop_hall_of_fame/button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bio_main.dart';

class Bio_header extends StatefulWidget {
  Bio_header({Key? key}) : super(key: key);

  @override
  _Bio_headerState createState() => _Bio_headerState();
}

class _Bio_headerState extends State<Bio_header> {
  double _screenWidth = 0;
  double _screenH = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenH = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: _screenWidth,
        height: _screenH,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.5), BlendMode.lighten),
                image: AssetImage("ast/9.png"),
                fit: BoxFit.cover)),
        child: Column(children: [
          Row(
              children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 705),
                  childAnimationBuilder: (widget) => SlideAnimation(
                        child: FadeInAnimation(
                          child: widget,
                        ),
                        verticalOffset: 220,
                      ),
                  children: [Gen_header(pageTo: home_page())])),
          SizedBox(
            height: _screenH / 8,
          ),
          Container(
            width: _screenWidth / 2.9,
            margin: EdgeInsets.only(right: _screenWidth / 1.8),
            padding: EdgeInsets.all(_screenWidth / 35),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 705),
                    childAnimationBuilder: (widget) => SlideAnimation(
                          child: FadeInAnimation(
                            child: widget,
                          ),
                          verticalOffset: 220,
                        ),
                    children: [
                      Container(
                        width: _screenWidth / 4,
                        child: Text(
                          "Biomaterials",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _screenH / 20),
                        ),
                      ),
                      SizedBox(
                        height: _screenH / 35,
                      ),
                      Container(
                        width: _screenWidth / 3,
                        child: Text(
                          "The area of Biomaterials is rapidly growing and offers many opportunities for Materials Engineers to put their problem solving skills to work to improve materials used in a range of health applications.",
                          style: TextStyle(fontSize: _screenH / 35),
                        ),
                      ),
                      SizedBox(
                        height: _screenH / 35,
                      ),
                      Button(
                          buttonIcon: FontAwesomeIcons.clinicMedical,
                          pageTo: bio_main(),
                          title: "Explore Biomaterials",
                          fontSize: _screenH / 40,
                          titleColor: Colors.blueAccent)
                    ])),
          )
        ]),
      ),
    );
  }
}
