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
    List<List<dynamic>> _listData = CsvToListConverter().convert(bio_data);
    setState(() {
      data = _listData;
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
    for (var i = 0; i < data.length; i++) {
      if (data[i][7] == "Phar") {
        phar.add(data[i]);
      }
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Biomaterial"),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: (_screenH * 3.4 / _screenWidth),
            padding: EdgeInsets.symmetric(
                horizontal: _screenWidth / 40, vertical: _screenH / 40),
            children: List.generate(1, (index) {
              return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 800),
                  columnCount: 1,
                  child: ScaleAnimation(
                      child: Person_back(
                          border_c: Colors.blue,
                          info:
                              "Company: ${data[index + 1][4]} \n${data[index + 1][5]}",
                          name: data[index + 1][1],
                          typ: data[index + 1][7],
                          profile_img:
                              "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/r.jpg?raw=true")));
            })));
  }
}
