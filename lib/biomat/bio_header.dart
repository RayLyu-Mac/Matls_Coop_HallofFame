import 'package:coop_hall_of_fame/header_mode.dart';
import 'package:flutter/material.dart';
import 'bio_main.dart';

class Bio_header extends StatefulWidget {
  Bio_header({Key? key}) : super(key: key);

  @override
  _Bio_headerState createState() => _Bio_headerState();
}

class _Bio_headerState extends State<Bio_header> {
  @override
  Widget build(BuildContext context) {
    return header(
        back_pic: "ast/9.png",
        buttonName: "Explore Biomaterials",
        cont:
            "The area of Biomaterials is rapidly growing and offers many opportunities for Materials Engineers to put their problem solving skills to work to improve materials used in a range of health applications.",
        pageTo: bio_main(),
        title: "Biomaterials");
  }
}
