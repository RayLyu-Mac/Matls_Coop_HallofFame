import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sprung/sprung.dart';
import 'package:page_transition/page_transition.dart';

class box_file extends StatefulWidget {
  final String? img;
  final String? title;
  final String? content;
  final double? width;
  final double? height;
  final String? labelName;
  final Widget? pageto;
  final Icon? buttonIcon;
  final MaterialStateProperty<Color>? but_col;
  box_file(
      {@required this.img,
      @required this.buttonIcon,
      @required this.labelName,
      @required this.but_col,
      @required this.pageto,
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
      margin: EdgeInsets.only(top: _screenH / 30),
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
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: _screenH / 30),
                    ),
                    SizedBox(
                      height: _screenH / 30,
                    ),
                    Text(
                      widget.content!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: _screenH / 40),
                    ),
                    SizedBox(
                      height: _screenH / 30,
                    ),
                    ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: widget.but_col!,
                          elevation: _hovering
                              ? MaterialStateProperty.resolveWith(
                                  (states) => 5.0)
                              : MaterialStateProperty.resolveWith(
                                  (states) => 25.0),
                        ),
                        icon: widget.buttonIcon!,
                        label: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: _screenH / 35,
                                horizontal: _screenWidth / 22),
                            child: Text(
                              widget.labelName!,
                              style: TextStyle(
                                  fontFamily: "g2", fontSize: _screenH / 28),
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 500),
                                  child: widget.pageto!));
                        })
                  ],
                ),
              ))),
      decoration: BoxDecoration(
          border: Border.all(width: 5, color: Colors.white.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(widget.img!))),
    );
  }
}
