import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/biomat/person_back.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class search_main extends StatefulWidget {
  final TextEditingController? controller;
  final List<String>? searchS;
  final List<List>? whole;
  final Color? border;
  search_main(
      {@required this.controller,
      @required this.border,
      @required this.searchS,
      @required this.whole,
      Key? key})
      : super(key: key);

  @override
  _search_mainState createState() => _search_mainState();
}

class _search_mainState extends State<search_main> {
  double _screenWidth = 0;
  double _screenH = 0;

  Icon icon = new Icon(
    Icons.search,
    color: Colors.grey.shade700,
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
              color: widget.border!.withOpacity(0.9)),
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
                    itemExtent: _screenH / 7,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: _screenH / 65),
                        decoration: BoxDecoration(
                            color: colorL[sresult[index][9]]!.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 5, color: colorL[sresult[index][9]]!)),
                        child: InkWell(
                          child: ListTile(
                            trailing: Icon(
                              FontAwesomeIcons.trophy,
                              size: _screenH / 29,
                            ),
                            title: Center(
                              child: Text(
                                sresult[index][1].toString() +
                                    "  --${sresult[index][5].toString()}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: _screenH / 26,
                                    fontFamily: data[index][8]),
                              ),
                            ),
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Person_back(
                                      width: _screenWidth / 4,
                                      heigt: _screenH / 4,
                                      border_c: colorL[data[index][9]],
                                      nameFont: data[index][8],
                                      info:
                                          "Company: ${data[index][4]} \n${data[index][5]}",
                                      name: data[index][1],
                                      typ: data[index][7],
                                      join_date: "11/17/21",
                                      contactType:
                                          data[index][2].toString().split(","),
                                      contactInfo:
                                          data[index][3].toString().split(","),
                                      profile_img: data[index][6]);
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
          sresult.add(widget.whole![j]);
        });
      }
    }
  }
}
