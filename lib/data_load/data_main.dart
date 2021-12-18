import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';

Future load_bio() async {
  final bio_data = await rootBundle.loadString("ast/csv/bio.csv");
  List<List<dynamic>> _listData = CsvToListConverter().convert(bio_data);
  return _listData;
}

Future load_smr() async {
  final smr_data = await rootBundle.loadString("ast/csv/smart.csv");
  List<List<dynamic>> _listData = CsvToListConverter().convert(smr_data);
  return _listData;
}

Future load_res() async {
  final res_data = await rootBundle.loadString("ast/csv/res.csv");
  List<List<dynamic>> _listData = CsvToListConverter().convert(res_data);
  return _listData;
}

Future load_manu() async {
  final ma_data = await rootBundle.loadString("ast/csv/manu.csv");
  List<List<dynamic>> _listData = CsvToListConverter().convert(ma_data);
  return _listData;
}

Future load_code() async {
  final co_data = await rootBundle.loadString("ast/csv/code.csv");
  List<List<dynamic>> _listData = CsvToListConverter().convert(co_data);
  return _listData;
}

Map<String, String> fieldPic = {
  "phar": "ast/6.png",
  "drug": "ast/10.png",
  "steel": "ast/7.png"
};

List<String> fonts = [
  "c1",
  "d",
  "e1",
  "f1",
  "g1",
  "l1",
  "o1",
  "p1",
  "s",
  "s1",
  "s2",
  "s3",
  "t",
  "a1",
  "s3",
  "g2"
];

Map<String, Color> colorL = {
  "blue": Colors.blue.shade200,
  "white": Colors.white,
  "green": Colors.green.shade200,
  "red": Colors.red.shade200,
  "purple": Colors.purple.shade100,
  "orange": Colors.orange.shade50,
  "indigo": Colors.indigo.shade100
};
