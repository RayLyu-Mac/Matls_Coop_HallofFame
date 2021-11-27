import 'package:flutter/material.dart';
import 'manu_header.dart';
import 'manu_main.dart';

class manu_assemble extends StatefulWidget {
  manu_assemble({Key? key}) : super(key: key);

  @override
  _manu_assembleState createState() => _manu_assembleState();
}

class _manu_assembleState extends State<manu_assemble> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [manu_header(), manu_main()],
    );
  }
}
