import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/header_mode.dart';
import 'res_main.dart';

class res_header extends StatefulWidget {
  res_header({Key? key}) : super(key: key);

  @override
  _res_headerState createState() => _res_headerState();
}

class _res_headerState extends State<res_header> {
  @override
  Widget build(BuildContext context) {
    return header(
      back_pic: "ast/1.png",
      buttonName: "Go Research",
      cont: "View the research opportunity in MSE",
      pageTo: res_main(),
      title: "Research",
      right: "yes",
    );
  }
}
