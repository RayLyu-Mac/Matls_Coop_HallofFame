import 'package:coop_hall_of_fame/header_mode.dart';
import 'package:flutter/material.dart';
import 'manu_main.dart';

class manu_header extends StatefulWidget {
  manu_header({Key? key}) : super(key: key);

  @override
  _manu_headerState createState() => _manu_headerState();
}

class _manu_headerState extends State<manu_header> {
  @override
  Widget build(BuildContext context) {
    return header(
        back_pic: "ast/4.png",
        buttonName: "Go Manufacturing",
        cont: "XXX",
        pageTo: manu_main(),
        title: "Manufacturing");
  }
}
