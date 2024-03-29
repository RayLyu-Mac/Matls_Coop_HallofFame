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

    _screenH = MediaQuery.of(context).size.height;
    _screenWidth = 16 / 10 * _screenH;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
          height: _screenH / 3.7 * 1.81,
          width: _screenWidth / 6.5 * 1.8,
          fit: BoxFit.cover,
          image: AssetImage("ast/frame.png")),
      decoration: BoxDecoration(
        image: DecorationImage(
            scale: 0.8,
            fit: BoxFit.fitHeight,
            image: NetworkImage(widget.profile!)),
      ),
    );
  }
}
