import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'person_back.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:coop_hall_of_fame/search/search_mode.dart';

class gen_mode extends StatefulWidget {
  final String? appTitle;
  final Color? b;
  final List<String>? hash;
  final List<String>? comp;
  final List<List<dynamic>>? data;
  final List<RotateAnimatedText>? typ;

  gen_mode(
      {@required this.appTitle,
      @required this.b,
      @required this.data,
      @required this.hash,
      @required this.comp,
      @required this.typ,
      Key? key})
      : super(key: key);

  @override
  _gen_modeState createState() => _gen_modeState();
}

class _gen_modeState extends State<gen_mode> {
  double _screenWidth = 0;
  double _screenH = 0;
  TextEditingController controller = new TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenH = MediaQuery.of(context).size.height;
    _screenWidth = 16 / 10 * _screenH;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.appTitle!,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showGeneralDialog(
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
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 8, color: widget.b!),
                                      borderRadius: BorderRadius.circular(35)),
                                  clipBehavior: Clip.hardEdge,
                                  backgroundColor: widget.b!.withOpacity(0.8),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: _screenWidth / 15,
                                  ),
                                  title: Row(
                                    children: [
                                      const Text("Looking for: "),
                                      SizedBox(
                                          width: 10, height: _screenH / 10),
                                      AnimatedTextKit(
                                          repeatForever: true,
                                          animatedTexts: widget.typ!)
                                    ],
                                  ),
                                  children: [
                                    Container(
                                      width: _screenWidth / 1.5,
                                      height: _screenH / 1.5,
                                      child: search_main(
                                          border: widget.b,
                                          controller: controller,
                                          compName: widget.comp,
                                          searchS: widget.hash,
                                          whole: widget.data),
                                    )
                                  ],
                                )));
                      });
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 40,
            mainAxisSpacing: 40,
            childAspectRatio: (_screenH * 3.4 / _screenWidth),
            padding: EdgeInsets.symmetric(
                horizontal: _screenWidth / 40, vertical: _screenH / 40),
            children: List.generate(2, (index) {
              return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 800),
                  columnCount: 1,
                  child: ScaleAnimation(
                      child: Person_back(
                          heigt: 0,
                          width: 0,
                          border_c: colorL[widget.data![index][9]],
                          nameFont: widget.data![index][8],
                          info:
                              "Company: ${widget.data![index][4]} \n${widget.data![index][5]}",
                          name: widget.data![index][1],
                          typ: widget.data![index][7],
                          join_date: "11/17/21",
                          contactType:
                              widget.data![index][2].toString().split(","),
                          contactInfo:
                              widget.data![index][3].toString().split(","),
                          profile_img: widget.data![index][6])));
            })));
  }
}
