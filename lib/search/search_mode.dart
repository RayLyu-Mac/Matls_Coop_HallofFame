import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/biomat/person_back.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';

class search_main extends StatefulWidget {
  final TextEditingController? controller;
  final List<String>? searchS;
  final List<List>? whole;
  search_main(
      {@required this.controller,
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
          child: TextField(
            controller: widget.controller,
            style: TextStyle(
              fontSize: _screenH / 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 1, 1, 1),
              border: OutlineInputBorder(),
              hintText: "Search Hash Tag...",
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(width: 2.5, color: Colors.black)),
            ),
            onChanged: search,
          ),
        ),
        sresult.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    itemCount: sresult.length,
                    itemExtent: _screenH / 10,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: colorL[data[index][9]],
                        child: InkWell(
                          child: ListTile(
                            title: Text(sresult[index][1].toString() +
                                "  --${sresult[index][5].toString()}"),
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
                    }))
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
