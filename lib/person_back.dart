import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:coop_hall_of_fame/button.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:coop_hall_of_fame/frameback.dart';
import 'dart:math';
import 'data_load/data_main.dart';
import 'package:url_launcher/url_launcher.dart';

class Person_back extends StatefulWidget {
  final Color? border_c;
  final String? name;
  final String? info;
  final double? backtr;
  final String? profile_img;
  final String? typ;
  final String? join_date;
  final List? contactType;
  final Color? iconcolor;

  final List? contactInfo;
  final String? has_tag;
  final String? nameFont;
  final double? width;
  final double? heigt;
  final String? year;
  final String? length;
  final String? spec;
  Person_back(
      {@required this.border_c,
      @optionalTypeArgs this.width,
      @optionalTypeArgs this.heigt,
      @required this.nameFont,
      @optionalTypeArgs this.backtr,
      @required this.spec,
      @required this.iconcolor,
      @required this.has_tag,
      @required this.contactType,
      @required this.year,
      @required this.length,
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
  double mainInfoFS = 34;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenH = MediaQuery.of(context).size.height;
    _screenWidth = 16 / 10 * _screenH;
  }

  @override
  Widget build(BuildContext context) {
    List<String> hashs = widget.has_tag!.split("+");

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widget.width!, vertical: widget.heigt!),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(widget.backtr ?? 0.3),
                  BlendMode.dstATop),
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
            width: _screenWidth / 30,
          ),
          Container(
            width: _screenWidth / 6.8,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 4, color: widget.border_c!.withOpacity(0.7)),
                image:
                    DecorationImage(image: NetworkImage(widget.profile_img!))),
          ),
          SizedBox(
            width: _screenWidth / 25,
          ),
          Container(
            width: _screenWidth / 4.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _screenH / 23,
                        fontFamily: "b1")),
                SizedBox(
                  height: _screenH / 45,
                ),
                Container(
                  width: _screenWidth / 2.8,
                  child: Text(
                    widget.info!,
                    style: TextStyle(
                      fontFamily: "b1",
                      fontSize: _screenH / 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: _screenH / 65,
                ),
                for (var t = 0; t < hashs.length; t++)
                  Text("# " + hashs[t],
                      style: TextStyle(
                          fontFamily: "b1",
                          fontSize: _screenH / 40,
                          fontWeight: FontWeight.bold,
                          color: colorX[t])
                      // colorX[Random().nextInt(colorX.length)])  colorX[t],
                      ),
                SizedBox(
                  height: _screenH / 65,
                ),
                Row(
                  children: [
                    for (var k = 0; k < widget.year!.split("+").length; k++)
                      Button(
                          buttonIcon: FontAwesomeIcons.info,
                          dialog: true,
                          pageTo: SimpleDialog(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 10, color: widget.iconcolor!),
                                borderRadius: BorderRadius.circular(45)),
                            clipBehavior: Clip.hardEdge,
                            backgroundColor: widget.border_c!.withOpacity(0.95),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: _screenWidth / 28,
                                vertical: _screenH / 18),
                            alignment: Alignment.center,
                            title: Row(
                              children: [
                                const Icon(FontAwesomeIcons.medal),
                                Text(
                                  " MATLS Co-op Hall of Fame Honor ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: _screenH / 25,
                                      fontFamily: fonts[
                                          Random().nextInt(fonts.length)]),
                                )
                              ],
                            ),
                            children: [
                              Row(
                                children: [
                                  framepic(profile: widget.profile_img),
                                  SizedBox(
                                    width: _screenWidth / 45,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.name!,
                                        style: TextStyle(
                                            fontSize: widget.nameFont != "o1"
                                                ? _screenH / 15
                                                : _screenH / 22,
                                            fontFamily: widget.nameFont
                                                .toString()
                                                .toLowerCase()
                                                .replaceAll(" ", "")),
                                      ),

                                      SizedBox(
                                        height: _screenH / 40,
                                      ),

                                      Container(
                                        width: _screenWidth / 2.8,
                                        child: SelectableText(
                                          widget.info!.split("+")[k],
                                          style: TextStyle(
                                            fontFamily: "b1",
                                            fontSize: _screenH / mainInfoFS,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: _screenH / 70,
                                      ),
                                      Text(
                                        "Got this Co-op @${widget.year!.split("+")[k]}\nFor ${widget.length!.split("+")[k]}",
                                        style: TextStyle(
                                          fontFamily: "b1",
                                          fontSize: _screenH / mainInfoFS,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: _screenH / 70,
                                      ),
                                      Row(
                                        children: [
                                          for (var i = 0;
                                              i < widget.contactType!.length;
                                              i++)
                                            IconButton(
                                                color: widget.iconcolor,
                                                tooltip: contact[widget
                                                    .contactType![i]
                                                    .toString()
                                                    .toLowerCase()
                                                    .replaceAll(" ", "")]![1],
                                                onPressed: () {
                                                  if (widget.contactType![i]
                                                              .toString()
                                                              .toLowerCase() ==
                                                          "linkedin" ||
                                                      widget.contactType![i]
                                                              .toString()
                                                              .toLowerCase() ==
                                                          "facebook") {
                                                    launch(
                                                        widget.contactInfo![i]);
                                                  } else {
                                                    showGeneralDialog(
                                                        barrierColor: Colors
                                                            .black
                                                            .withOpacity(0.5),
                                                        transitionDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        barrierDismissible:
                                                            true,
                                                        barrierLabel: '',
                                                        context: context,
                                                        pageBuilder: (context,
                                                            animation,
                                                            secondaryAnimation) {
                                                          return Container();
                                                        },
                                                        transitionBuilder:
                                                            (context, a1, a2,
                                                                widgets) {
                                                          return Transform.scale(
                                                              scale: a1.value,
                                                              child: Opacity(
                                                                  opacity: a1.value,
                                                                  child: SimpleDialog(
                                                                    shape: RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            width:
                                                                                7,
                                                                            color: widget
                                                                                .border_c!),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    children: [
                                                                      Container(
                                                                        child:
                                                                            Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: _screenWidth / 10,
                                                                              vertical: _screenH / 15),
                                                                          child:
                                                                              SelectableText(
                                                                            "\n\n" +
                                                                                contact[widget.contactType![i].toString().toLowerCase().replaceAll(" ", "")]![1] +
                                                                                "  " +
                                                                                "\n\n" +
                                                                                widget.contactInfo![i] +
                                                                                "\n\n",
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: TextStyle(
                                                                                fontFamily: "b1",
                                                                                fontSize: _screenH / 30,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                        decoration: BoxDecoration(
                                                                            image: DecorationImage(
                                                                                scale: 2,
                                                                                colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.dstATop),
                                                                                fit: BoxFit.cover,
                                                                                image: AssetImage(contact[widget.contactType![i].toString().toLowerCase().replaceAll(" ", "")]![2]))),
                                                                      ),
                                                                    ],
                                                                  )));
                                                        });
                                                  }
                                                },
                                                icon: Icon(contact[widget
                                                    .contactType![i]
                                                    .toString()
                                                    .toLowerCase()
                                                    .replaceAll(" ", "")]![0]))
                                        ],
                                      ),
                                      // SelectableText(
                                      //   "${widget.contactType![i]}: ${widget.contactInfo![i]}",
                                      //   style: TextStyle(
                                      //     fontFamily: "b1",
                                      //     fontSize: _screenH / mainInfoFS,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: _screenH / 25,
                                      ),
                                      Row(
                                        children: [
                                          Text("Highlight  ",
                                              style: TextStyle(
                                                  fontSize:
                                                      widget.nameFont != "o1"
                                                          ? _screenH / 17
                                                          : _screenH / 24,
                                                  fontFamily: widget.nameFont
                                                      .toString()
                                                      .toLowerCase()
                                                      .replaceAll(" ", ""))),
                                          Icon(FontAwesomeIcons.meteor)
                                        ],
                                      ),

                                      SizedBox(
                                        height: _screenH / 45,
                                      ),
                                      Container(
                                        width: _screenWidth / 2.8,
                                        child: Text(
                                          widget.spec!.split("+")[k],
                                          style: TextStyle(
                                            fontFamily: "b1",
                                            fontSize:
                                                _screenH / (mainInfoFS + 8),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: _screenH / 45,
                                      ),
                                      // RotationTransition(
                                      //   turns: AlwaysStoppedAnimation(340 / 360),
                                      //   child: Container(
                                      //     padding: EdgeInsets.all(10),
                                      //     decoration: BoxDecoration(
                                      //         borderRadius: BorderRadius.circular(15),
                                      //         border: Border.all(
                                      //             width: 5,
                                      //             color:
                                      //                 Colors.black.withOpacity(0.4))),
                                      //     child: Text(
                                      //       "Coop Hall Of Fame",
                                      //       style: TextStyle(
                                      //           fontFamily: "s2",
                                      //           fontWeight: FontWeight.bold,
                                      //           fontSize: _screenH / 25,
                                      //           color: Colors.black.withOpacity(0.4)),
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          fontSize: _screenH / 45,
                          title: "Coop # ${k + 1}",
                          titleColor: widget.border_c)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
