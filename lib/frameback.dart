import 'package:flutter/material.dart';

class framepic extends StatefulWidget {
  final String? profile;
  framepic({@required this.profile, Key? key}) : super(key: key);

  @override
  _framepicState createState() => _framepicState();
}

class _framepicState extends State<framepic> {
  double _screenWidth = 0;
  double _screenH = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenWidth = MediaQuery.of(context).size.width;
    _screenH = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
              top: 6,
              left: 4,
              child: Image(
                  height: _screenH / 5,
                  width: _screenWidth / 4.2,
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/r.jpg?raw=true"))),
          Positioned(
              top: 0,
              left: 0,
              child: Image(
                  height: _screenH / 3.8,
                  width: _screenWidth / 3.8,
                  fit: BoxFit.fitHeight,
                  image: AssetImage("ast/frame.png")))
        ],
      ),
    );
  }
}
