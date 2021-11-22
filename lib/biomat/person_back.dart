import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:coop_hall_of_fame/button.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:coop_hall_of_fame/frameback.dart';
import 'dart:math';

class Person_back extends StatefulWidget {
  final Color? border_c;
  final String? name;
  final String? info;
  final String? profile_img;
  final String? typ;
  final String? join_date;
  final List? contactType;
  final List? contactInfo;
  final String? nameFont;
  final double? width;
  final double? heigt;
  Person_back(
      {@required this.border_c,
      @optionalTypeArgs this.width,
      @optionalTypeArgs this.heigt,
      @required this.nameFont,
      @required this.contactType,
      @required this.contactInfo,
      @required this.join_date,
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
      margin: EdgeInsets.symmetric(
          horizontal: widget.width!, vertical: widget.heigt!),
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
                border: Border.all(width: 6, color: widget.border_c!),
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
                    pageTo: SimpleDialog(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 8, color: widget.border_c!),
                          borderRadius: BorderRadius.circular(35)),
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: widget.border_c!.withOpacity(0.8),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: _screenWidth / 18,
                          vertical: _screenH / 18),
                      alignment: Alignment.center,
                      title: Row(
                        children: [
                          Icon(FontAwesomeIcons.medal),
                          Text(
                            " MATLS Co-op Hall of Fame Honor ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: _screenH / 25,
                                fontFamily:
                                    fonts[Random().nextInt(fonts.length)]),
                          )
                        ],
                      ),
                      children: [
                        Row(
                          children: [
                            framepic(profile: widget.profile_img),
                            SizedBox(
                              width: _screenWidth / 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(FontAwesomeIcons.star),
                                    Text(
                                      "  ${widget.name!}  ",
                                      style: TextStyle(
                                          fontSize: _screenH / 20,
                                          fontFamily: widget.nameFont),
                                    ),
                                    Icon(FontAwesomeIcons.star),
                                  ],
                                ),
                                SizedBox(
                                  height: _screenH / 30,
                                ),
                                Text(
                                    "Joined Hall of Fame @ ${widget.join_date}\n${widget.info}",
                                    style: TextStyle(
                                      fontSize: _screenH / 30,
                                    )),
                                for (var i = 0;
                                    i < widget.contactType!.length;
                                    i++)
                                  Text(
                                    "${widget.contactType![i]}: ${widget.contactInfo![i]}",
                                    style: TextStyle(
                                      fontSize: _screenH / 30,
                                    ),
                                  ),
                                SizedBox(
                                  height: _screenH / 45,
                                ),
                                RotationTransition(
                                  turns: AlwaysStoppedAnimation(340 / 360),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 5,
                                            color:
                                                Colors.black.withOpacity(0.4))),
                                    child: Text(
                                      "Coop Hall Of Fame",
                                      style: TextStyle(
                                          fontFamily: "s2",
                                          fontWeight: FontWeight.bold,
                                          fontSize: _screenH / 25,
                                          color: Colors.black.withOpacity(0.4)),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    fontSize: _screenH / 50,
                    title: "More Info",
                    titleColor: widget.border_c)
              ],
            ),
          )
        ],
      ),
    );
  }
}
