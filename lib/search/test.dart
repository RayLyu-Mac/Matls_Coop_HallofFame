import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:coop_hall_of_fame/frameback.dart';
import 'package:coop_hall_of_fame/person_back.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:coop_hall_of_fame/search/search_mode.dart';

class t extends StatefulWidget {
  t({Key? key}) : super(key: key);

  @override
  _tState createState() => _tState();
}

class _tState extends State<t> {
  List<List<dynamic>> data = [];
  List<String> hash = [];
  TextEditingController controller = new TextEditingController();
  void load_bio() async {
    final bio_data = await rootBundle.loadString("ast/csv/bio.csv");
    List<List<dynamic>> _listData =
        CsvToListConverter().convert(bio_data).sublist(1);
    setState(() {
      data = _listData;
      for (var i = 0; i < data.length; i++) {
        hash.add(data[i][5]);
      }
      print(hash);
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
      body: search_main(controller: controller, searchS: hash, whole: data),
    );
  }
}
