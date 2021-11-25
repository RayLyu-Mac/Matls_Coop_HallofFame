import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'person_back.dart';
import 'dart:math';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:coop_hall_of_fame/search/search_mode.dart';
import 'package:coop_hall_of_fame/genmode.dart';

class bio_main extends StatefulWidget {
  bio_main({Key? key}) : super(key: key);

  @override
  _bio_mainState createState() => _bio_mainState();
}

class _bio_mainState extends State<bio_main> {
  double _screenWidth = 0;
  double _screenH = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenH = MediaQuery.of(context).size.height;
    _screenWidth = 16 / 10 * _screenH;
  }

  List<List<dynamic>> data = [];
  List<String> hash = [];
  List<String> comp = [];
  List<RotateAnimatedText> typ = [];
  Color b = colorL[
      colorL.keys.toList()[Random().nextInt(colorL.keys.toList().length)]]!;

  TextEditingController controller = new TextEditingController();
  void load_bio() async {
    final bio_data = await rootBundle.loadString("ast/csv/bio.csv");
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

  //search_main(controller: controller, searchS: hash, whole: data)
  @override
  void initState() {
    // TODO: implement initState
    load_bio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return gen_mode(
      appTitle: "Biomaterial",
      b: b,
      data: data,
      hash: hash,
      typ: typ,
      comp: comp,
    );
  }
}
