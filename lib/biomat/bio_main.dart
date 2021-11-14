import 'package:flutter/material.dart';

class bio_main extends StatefulWidget {
  bio_main({Key? key}) : super(key: key);

  @override
  _bio_mainState createState() => _bio_mainState();
}

class _bio_mainState extends State<bio_main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biomaterial"),
      ),
    );
  }
}
