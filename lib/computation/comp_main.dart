import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/header_mode.dart';
import 'package:coop_hall_of_fame/gen_mode.dart';

class code_page extends StatefulWidget {
  code_page({Key? key}) : super(key: key);

  @override
  _code_pageState createState() => _code_pageState();
}

class _code_pageState extends State<code_page> {
  List<List<dynamic>> datas = [];
  PageController controller = PageController(initialPage: 0);
  void load_res() async {
    controller.animateTo(500,
        duration: const Duration(microseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: [
        header(
            back_pic: "ast/9.png",
            buttonName: "Explore Biomaterials",
            cont:
                "The fundamental understanding of material structure, particularly at the nano- and micro-scale, allow us to modify materials to control interactions at biointerfaces, develop advanced characterization tools and create new biofunctional materials. The area of Biomaterials is rapidly growing and offers many opportunities for Materials Engineers to put their problem solving skills to work to improve materials used in a range of health applications.",
            pageTo: ElevatedButton(
              child: Text("Go Code!"),
              onPressed: load_res,
            ),
            title: "Biomaterials"),
        gen_mode(
          appTitle: "Biomaterial",
          fileName: "ast/csv/code.csv",
        )
      ],
    );
  }
}
