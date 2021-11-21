import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:coop_hall_of_fame/frameback.dart';
import 'person_back.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
  List<List> phar = [];
  void load_bio() async {
    final bio_data = await rootBundle.loadString("ast/csv/bio.csv");
    List<List<dynamic>> _listData =
        CsvToListConverter().convert(bio_data).sublist(1);
    setState(() {
      data = _listData;
      print(data);
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Biomaterial"),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 40,
            mainAxisSpacing: 40,
            childAspectRatio: (_screenH * 3.4 / _screenWidth),
            padding: EdgeInsets.symmetric(
                horizontal: _screenWidth / 40, vertical: _screenH / 40),
            children: List.generate(2, (index) {
              return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 800),
                  columnCount: 1,
                  child: ScaleAnimation(
                      child: Person_back(
                          border_c: colorL[data[index][9]],
                          nameFont: data[index][8],
                          info:
                              "Company: ${data[index][4]} \n${data[index][5]}",
                          name: data[index][1],
                          typ: data[index][7],
                          join_date: "11/17/21",
                          contactType: data[index][2].toString().split(","),
                          contactInfo: data[index][3].toString().split(","),
                          profile_img: data[index][6])));
            })));
  }
}