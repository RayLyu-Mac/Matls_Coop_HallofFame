import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:coop_hall_of_fame/frameback.dart';

class bio_main extends StatefulWidget {
  bio_main({Key? key}) : super(key: key);

  @override
  _bio_mainState createState() => _bio_mainState();
}

class _bio_mainState extends State<bio_main> {
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
      body: Center(
        child: framepic(profile: "profile"),
      ),
    );
  }
}
