import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:flutter/material.dart';

import 'person_back.dart';
import 'data_load/data_main.dart';

class test extends StatefulWidget {
  test({Key? key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Person_back(
          width: 0,
          heigt: 0,
          border_c: colorL["Blue"],
          nameFont: "g1",
          contactType: ["Email"],
          contactInfo: ["lyuz"],
          join_date: "2021",
          info: "qqqq",
          name: "Ray",
          typ: "Drug",
          profile_img:
              "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/r.jpg?raw=true"),
    );
  }
}
