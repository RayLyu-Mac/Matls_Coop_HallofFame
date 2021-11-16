import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Gen_header extends StatefulWidget {
  final Widget? pageTo;
  Gen_header({@required this.pageTo, Key? key}) : super(key: key);

  @override
  _Gen_headerState createState() => _Gen_headerState();
}

class _Gen_headerState extends State<Gen_header> {
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
        margin: EdgeInsets.symmetric(
            vertical: _screenH / 55, horizontal: _screenWidth / 70),
        padding: EdgeInsets.symmetric(
            vertical: _screenH / 40, horizontal: _screenWidth / 50),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: TextButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 500),
                      child: widget.pageTo!,
                      type: PageTransitionType.rightToLeft));
            },
            icon: Icon(
              FontAwesomeIcons.trophy,
              color: Colors.yellow.shade700,
            ),
            label: Text(
              "  Co-op Hall of Fame",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: _screenH / 36),
            )));
  }
}
