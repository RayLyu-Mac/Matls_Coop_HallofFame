import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';
import 'package:page_transition/page_transition.dart';

class box_file extends StatefulWidget {
  final String? img;
  final String? title;
  final String? content;
  final double? width;
  final double? height;
  box_file(
      {@required this.img,
      @required this.height,
      @required this.width,
      @required this.content,
      @required this.title,
      Key? key})
      : super(key: key);

  @override
  _box_fileState createState() => _box_fileState();
}

class _box_fileState extends State<box_file> {
  double _screenWidth = 0;
  double _screenH = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenWidth = MediaQuery.of(context).size.width;
    _screenH = MediaQuery.of(context).size.height;
  }

  bool _hovering = false;
  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }

  final nonHoverTransform = Matrix4.identity()
    ..translate(0, 0, 0)
    ..scale(0.001);

  final hoverTransform = Matrix4.identity()
    ..translate(0, 0, 0)
    ..scale(1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: MouseRegion(
          onEnter: (e) => _mouseEnter(true),
          onExit: (e) => _mouseEnter(false),
          child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Sprung.overDamped,
              transform: _hovering ? hoverTransform : nonHoverTransform,
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: _screenH / 20),
                    ),
                    SizedBox(
                      height: _screenH / 30,
                    ),
                    Text(
                      widget.title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: _screenH / 30),
                    ),
                  ],
                ),
              ))),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight, image: AssetImage(widget.img!))),
    );
  }
}
