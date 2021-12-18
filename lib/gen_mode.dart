// ignore_for_file: camel_case_types
// In Visual Studio: Ctrl+K+C will comment, Ctrl+K+U Will uncomment
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'person_back.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:coop_hall_of_fame/search/search_mode.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'dart:math';
import 'frameback.dart';
import 'package:flip_card/flip_card.dart';

class gen_mode extends StatefulWidget {
  final String? appTitle;

  final String? fileName;

  const gen_mode({@required this.appTitle, @required this.fileName, Key? key})
      : super(key: key);

  @override
  _gen_modeState createState() => _gen_modeState();
}

class _gen_modeState extends State<gen_mode> {
  List<List> datas = [];
  List<List> data = [
    [
      "11/21/2021",
      "Ray Lyu",
      "Email",
      "lyuz11@mcmaster.ca",
      "Apotex",
      "3rd",
      "12 month",
      "Manufacutirng+Pharmeutical",
      "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/r.jpg?raw=true",
      "Phar",
      "g1",
      "Indigo",
      "ZXC",
      "qqq"
    ],
    [
      "11/21/2021",
      "ZiHan Lyu",
      "Email",
      "lyuz11@mcmaster.ca",
      "Hp",
      "2rd",
      "10 month",
      "Computer",
      "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/r.jpg?raw=true",
      "Drug",
      "l1",
      "Green",
      "ZXC",
      "qqq"
    ]
  ];
  List<String> comp = [];
  List<String> datasplit = [];
  List<RotateAnimatedText> typ = [];
  List<String> imgs = [];
  List<String> hash = [];
  List<String> join_time = [];
  List<String> contact = [];
  List<String> cols = [];
  List<String> contactD = [];
  Color b = colorL[
      colorL.keys.toList()[Random().nextInt(colorL.keys.toList().length)]]!;

  bool isLoad = true;
  double _screenWidth = 0;
  double _screenH = 0;
  TextEditingController controller = TextEditingController();

  load() async {
    final bio_data = await rootBundle.loadString("ast/csv/bio.csv");
    setState(() {
      datas = const CsvToListConverter().convert(bio_data);

      datasplit = datas[0].toString().split("*");
      for (var k = 1; k < datasplit.length - 1; k++) {
        data.add(datasplit[k].toString().split(","));
      }
      for (var o = 0; o < data.length; o++) {
        imgs.add(data[o][8].toString().replaceAll(" ", ""));
        cols.add(data[o][11].toString().toLowerCase().replaceAll(" ", ""));
        comp.add(data[o][4]);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenH = MediaQuery.of(context).size.height;
    _screenWidth = 16 / 10 * _screenH;
  }

  @override
  void initState() {
    // TODO: implement initState
    load();
    super.initState();
    setState(() {
      for (var o = 0; o < data.length; o++) {
        imgs.add(data[o][8].toString().replaceAll(" ", ""));
        cols.add(data[o][11].toString().toLowerCase().replaceAll(" ", ""));

        comp.add(data[o][4]);
        typ.add(RotateAnimatedText(data[o][5]));
        typ.add(RotateAnimatedText(data[o][4]));
        hash.add(data[o][7]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      return Scaffold(
          appBar: AppBar(
            title: SelectableText(
              widget.appTitle!,
              style: TextStyle(fontFamily: "b1"),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showGeneralDialog(
                        barrierColor: b,
                        transitionDuration: Duration(milliseconds: 300),
                        barrierDismissible: true,
                        barrierLabel: '',
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return Container();
                        },
                        transitionBuilder: (context, a1, a2, widgets) {
                          return Transform.scale(
                              scale: a1.value,
                              child: Opacity(
                                  opacity: a1.value,
                                  child: SimpleDialog(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 8, color: b),
                                        borderRadius:
                                            BorderRadius.circular(35)),
                                    clipBehavior: Clip.hardEdge,
                                    backgroundColor: b.withOpacity(0.8),
                                    elevation: 20,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: _screenWidth / 15,
                                    ),
                                    title: Row(
                                      children: [
                                        const Text("Looking for: "),
                                        SizedBox(
                                            width: 10, height: _screenH / 8),
                                        AnimatedTextKit(
                                            repeatForever: true,
                                            animatedTexts: typ)
                                      ],
                                    ),
                                    children: [
                                      Container(
                                        width: _screenWidth / 1.5,
                                        height: _screenH / 1.5,
                                        child: search_main(
                                            border: b,
                                            controller: controller,
                                            compName: comp,
                                            searchS: hash,
                                            whole: data),
                                      )
                                    ],
                                  )));
                        });
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ))
            ],
          ),
          body: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
              childAspectRatio: (_screenH * 3.4 / _screenWidth),
              padding: EdgeInsets.symmetric(
                  horizontal: _screenWidth / 40, vertical: _screenH / 40),
              children: List.generate(data.length, (index) {
                return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 800),
                    columnCount: 1,
                    child: ScaleAnimation(
                        child: FlipCard(
                            fill: Fill.fillBack,
                            direction: FlipDirection.HORIZONTAL,
                            front: Person_back(
                                width: 0,
                                heigt: 0,
                                spec: data[index][13].toString(),
                                border_c: colorL[cols[index]],
                                has_tag: hash[index].toString(),
                                nameFont: data[index][10].toString(),
                                contactType:
                                    data[index][2].toString().split("+"),
                                contactInfo:
                                    data[index][3].toString().split("+"),
                                join_date: data[index][0].toString(),
                                info: "Company: ${comp[index]}",
                                name: data[index][1].toString(),
                                typ: "Drug",
                                profile_img: imgs[index]),
                            back: Container(
                              decoration: BoxDecoration(
                                  color: colorL[cols[index]]!.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    width: 5,
                                    color: colorL[cols[index]]!,
                                  )),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        "MSE Coop Hall of Fame: ${widget.appTitle}",
                                        style: TextStyle(
                                            fontFamily: "s2",
                                            fontWeight: FontWeight.bold,
                                            fontSize: _screenH / 25,
                                            color:
                                                Colors.black.withOpacity(0.4))),
                                    Text("Joined @${data[index][0].toString()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: _screenH / 25,
                                            color:
                                                Colors.black.withOpacity(0.4)))
                                  ],
                                ),
                              ),
                            ))));
              })));
    } else {
      return Container(
        color: Colors.white,
        width: 500,
        height: 500,
        child: Column(
          children: [
            Text(datas.toString()),
            CircularProgressIndicator(),
            Text("ZZZ" + data.toString() + "QQQ\n" + datas.toString())
          ],
        ),
      );
    }
    ;
  }
}
