import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/header_mode.dart';
import 'package:coop_hall_of_fame/gen_mode.dart';

class manu_page extends StatefulWidget {
  manu_page({Key? key}) : super(key: key);

  @override
  _manu_pageState createState() => _manu_pageState();
}

class _manu_pageState extends State<manu_page> {
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
                "OOO growing and offers many opportunities for Materials Engineers to put their problem solving skills to work to improve materials used in a range of health applications.",
            pageTo: ElevatedButton(
              child: Text("Go Bio!"),
              onPressed: load_res,
            ),
            title: "Biomaterials"),
        gen_mode(
          appTitle: "Manufacturing",
          fileName: "ast/csv/manu.csv",
        )
      ],
    );
  }
}
