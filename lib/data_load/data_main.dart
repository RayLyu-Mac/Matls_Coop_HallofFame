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

Map<String, String> fieldPic = {"Phar": "ast/6.png", "Drug": "ast/10.png"};
