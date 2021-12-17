import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/person_back.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class search_main extends StatefulWidget {
  final TextEditingController? controller;
  final List<String>? searchS;
  final List<String>? compName;
  final List<List>? whole;
  final Color? border;
  search_main(
      {@required this.controller,
      @required this.border,
      @required this.compName,
      @required this.searchS,
      @required this.whole,
      Key? key})
      : super(key: key);

  @override
  _search_mainState createState() => _search_mainState();
}

class _search_mainState extends State<search_main> {
  List<Icon> suffixIcon = [
    Icon(FontAwesomeIcons.hashtag),
    Icon(FontAwesomeIcons.industry),
  ];
  List<Color> tc = [
    Colors.red.shade200,
    Colors.grey.shade300,
  ];
  double _screenWidth = 0;
  double _screenH = 0;

  Icon icon = new Icon(
    Icons.search,
    color: Colors.grey.shade700,
    size: 42,
  );
  List<List> sresult = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenH = MediaQuery.of(context).size.height;
    _screenWidth = 16 / 10 * _screenH;
  }

  @override
  Widget build(BuildContext context) {
    List<List> data = widget.whole!;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 12, color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(15),
              color: widget.border!.withOpacity(0.6)),
          child: TextField(
            controller: widget.controller,
            style: TextStyle(
              fontSize: _screenH / 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.transparent,
                suffixIcon: Icon(
                  sresult.isEmpty ? Icons.search : Icons.cancel,
                  color: Colors.grey.shade100,
                  size: _screenH / 24,
                ),
                contentPadding: EdgeInsets.fromLTRB(10, 1, 1, 1),
                hintText: "Search Hash Tag...",
                hintStyle: TextStyle(color: Colors.grey.shade100)),
            onChanged: search,
          ),
        ),
        SizedBox(
          height: _screenH / 70,
        ),
        sresult.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    itemCount: sresult.length,
                    itemExtent: _screenH / 6,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: _screenWidth / 75),
                        margin: EdgeInsets.only(top: _screenH / 65),
                        decoration: BoxDecoration(
                            color: tc[sresult[index][1]],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 5, color: tc[sresult[index][1]])),
                        child: InkWell(
                          child: ListTile(
                            trailing: suffixIcon[sresult[index][1]],
                            title: Center(
                              child: Row(
                                children: [
                                  Container(
                                    width: _screenWidth / 14,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 3,
                                            color: tc[sresult[index][1]]
                                                .withOpacity(0.6)),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                sresult[index][0][6]))),
                                  ),
                                  SizedBox(
                                    width: _screenWidth / 40,
                                  ),
                                  Text(
                                    sresult[index][0][1].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: _screenH / 22,
                                        fontFamily: sresult[index][0][8]),
                                  ),
                                  Text(
                                    "   --${sresult[index][2]}",
                                    style: TextStyle(
                                        fontSize: _screenH / 35,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            print(
                              sresult[index][0][11]
                                  .toString()
                                  .toLowerCase()
                                  .replaceAll(" ", ""),
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Person_back(
                                      width: _screenWidth / 4,
                                      heigt: _screenH / 4,
                                      border_c: colorL[sresult[index][0][11]
                                          .toString()
                                          .toLowerCase()
                                          .replaceAll(" ", "")],
                                      nameFont: sresult[index][0][10],
                                      info:
                                          "Company: ${sresult[index][0][4]} \n${sresult[index][0][5]}",
                                      name: sresult[index][0][1],
                                      typ: sresult[index][0][9],
                                      join_date: "11/17/21",
                                      contactType: sresult[index][0][2]
                                          .toString()
                                          .split(","),
                                      contactInfo: sresult[index][0][3]
                                          .toString()
                                          .split(","),
                                      profile_img: sresult[index][0][8]);
                                });
                          },
                        ),
                      );
                    }),
              )
            : Container()
      ],
    );
  }

  void search(String st) {
    sresult.clear();
    for (var j = 0; j < widget.searchS!.length; j++) {
      if (widget.searchS![j].toLowerCase().contains(st.toLowerCase())) {
        setState(() {
          sresult.add([widget.whole![j], 0, widget.searchS![j]]);
        });
      }
    }
    for (var k = 0; k < widget.compName!.length; k++) {
      if (widget.compName![k].toLowerCase().contains(st.toLowerCase())) {
        setState(() {
          sresult.add([widget.whole![k], 1, widget.compName![k]]);
        });
      }
    }
  }
}
