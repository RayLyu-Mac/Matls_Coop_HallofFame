import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:math';
import 'package:coop_hall_of_fame/genmode.dart';

class manu_main extends StatefulWidget {
  manu_main({Key? key}) : super(key: key);

  @override
  _manu_mainState createState() => _manu_mainState();
}

class _manu_mainState extends State<manu_main> {
  List<List<dynamic>> data = [];
  List<String> hash = [];
  List<String> comp = [];
  List<RotateAnimatedText> typ = [];
  Color b = colorL[
      colorL.keys.toList()[Random().nextInt(colorL.keys.toList().length)]]!;
  void load_bio() async {
    final man_data = await rootBundle.loadString("ast/csv/manu.csv");
    List<List<dynamic>> _listData =
        CsvToListConverter().convert(man_data).sublist(1);
    setState(() {
      data = _listData;
      for (var i = 0; i < data.length; i++) {
        hash.add(data[i][5]);
        comp.add(data[i][4].toString().split(",")[0]);
        typ.add(RotateAnimatedText(data[i][5]));
        typ.add(RotateAnimatedText(data[i][4]));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    load_bio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return gen_mode(
        appTitle: "Manufacturing",
        b: b,
        data: data,
        hash: hash,
        comp: comp,
        typ: typ);
  }
}
