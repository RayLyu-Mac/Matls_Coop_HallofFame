import 'package:flutter/material.dart';
import 'res_header.dart';
import 'res_main.dart';

class res_assemble extends StatefulWidget {
  res_assemble({Key? key}) : super(key: key);

  @override
  _res_assembleState createState() => _res_assembleState();
}

class _res_assembleState extends State<res_assemble> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [res_header(), res_main()],
    );
  }
}
