import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Button extends StatefulWidget {
  Button(
      {@required this.buttonIcon,
      @required this.pageTo,
      @optionalTypeArgs this.dia,
      @required this.title,
      @optionalTypeArgs this.dialog,
      @required this.titleColor,
      @optionalTypeArgs this.fontSize,
      Key? key})
      : super(key: key);
  final Widget? pageTo;
  final String? title;
  final List<Widget>? dia;
  final IconData? buttonIcon;
  final Color? titleColor;
  final double? fontSize;
  final bool? dialog;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: _screenH / 50, horizontal: _screenWidth / 50),
      decoration: BoxDecoration(
        color:
            _hovering ? Colors.grey.shade300.withAlpha(85) : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: FlatButton.icon(
            onPressed: () {
              widget.dialog != null
                  ? showGeneralDialog(
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: Duration(milliseconds: 300),
                      barrierDismissible: true,
                      barrierLabel: '',
                      context: context,
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Container();
                      },
                      transitionBuilder: (context, a1, a2, widgets) {
                        return Transform.scale(
                            scale: a1.value,
                            child: Opacity(
                                opacity: a1.value,
                                child: SimpleDialog(
                                  children: widget.dia,
                                  shape: Border.all(
                                    width: 4,
                                    style: BorderStyle.solid,
                                    color: Colors.white,
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 25, 35),
                                )));
                      })
                  : Navigator.push(
                      context,
                      PageTransition(
                          duration: const Duration(milliseconds: 500),
                          child: widget.pageTo!,
                          type: PageTransitionType.rightToLeft));
            },
            icon: Icon(widget.buttonIcon!),
            label: Text(
              '  ' + widget.title!,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: _hovering ? widget.titleColor! : Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.fontSize ?? _screenH / 20,
                  fontFamily: "show"),
            )),
      ),
    );
  }
}
