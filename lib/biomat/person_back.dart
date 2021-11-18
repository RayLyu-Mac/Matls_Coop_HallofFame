import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:coop_hall_of_fame/button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:coop_hall_of_fame/frameback.dart';

class Person_back extends StatefulWidget {
  final Color? border_c;
  final String? name;
  final String? info;
  final String? profile_img;
  final Widget? pagetTo;
  final String? typ;
  final String? join_date;
  Person_back(
      {@required this.border_c,
      @required this.join_date,
      @required this.pagetTo,
      @required this.info,
      @required this.name,
      @required this.typ,
      @required this.profile_img,
      Key? key})
      : super(key: key);

  @override
  _Person_backState createState() => _Person_backState();
}

class _Person_backState extends State<Person_back> {
  double _screenWidth = 0;
  double _screenH = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenH = MediaQuery.of(context).size.height;
    _screenWidth = 16 / 10 * _screenH;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _screenH / 10,
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.5), BlendMode.dstATop),
              fit: BoxFit.cover,
              image: AssetImage(fieldPic[widget.typ]!)),
          border: Border.all(
            width: 5,
            color: widget.border_c!,
          ),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: _screenWidth / 12,
          ),
          Container(
            width: _screenWidth / 6.6,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 6, color: Colors.grey.shade300),
                image:
                    DecorationImage(image: NetworkImage(widget.profile_img!))),
          ),
          SizedBox(
            width: _screenWidth / 13,
          ),
          Container(
            width: _screenWidth / 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: _screenH / 35)),
                SizedBox(
                  height: _screenH / 40,
                ),
                Text(widget.info!),
                Button(
                    buttonIcon: FontAwesomeIcons.ad,
                    dialog: true,
                    dia: [
                      Row(
                        children: [
                          framepic(profile: widget.profile_img),
                          SizedBox(
                            width: _screenWidth / 30,
                          ),
                          Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              fieldPic[widget.typ]!))))
                            ],
                          )
                        ],
                      )
                    ],
                    pageTo: widget.pagetTo,
                    title: "Learn More About Me",
                    titleColor: widget.border_c)
              ],
            ),
          )
        ],
      ),
    );
  }
}
