import 'package:flutter/material.dart';

class Person_back extends StatefulWidget {
  final Color? border_c;
  Person_back({@required this.border_c, Key? key}) : super(key: key);

  @override
  _Person_backState createState() => _Person_backState();
}

class _Person_backState extends State<Person_back> {
  double _screenWidth = 0;
  double _screenH = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenH = MediaQuery.of(context).size.height;
    _screenWidth = 16 / 10 * _screenH;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: widget.border_c!,
          ),
          borderRadius: BorderRadius.circular(25)),
    );
  }
}
