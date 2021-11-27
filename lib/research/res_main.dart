import 'package:coop_hall_of_fame/research/res_header.dart';
import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/genmode.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:math';

class res_main extends StatefulWidget {
  res_main({Key? key}) : super(key: key);

  @override
  _res_mainState createState() => _res_mainState();
}

class _res_mainState extends State<res_main> {
  List<List<dynamic>> data = [];
  List<String> comp = [];
  List<RotateAnimatedText> typ = [];
  List<String> hash = [];
  Color b = colorL[
      colorL.keys.toList()[Random().nextInt(colorL.keys.toList().length)]]!;
  void load_res() async {
    final bio_data = await rootBundle.loadString("ast/csv/res.csv");
    List<List<dynamic>> _listData =
        CsvToListConverter().convert(bio_data).sublist(1);
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
    load_res();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return gen_mode(
        appTitle: "Research",
        b: b,
        data: data,
        hash: hash,
        comp: comp,
        typ: typ);
  }
}
