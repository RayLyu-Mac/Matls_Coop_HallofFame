import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/header_mode.dart';
import 'package:coop_hall_of_fame/gen_mode.dart';

class res_page extends StatefulWidget {
  res_page({Key? key}) : super(key: key);

  @override
  _res_pageState createState() => _res_pageState();
}

class _res_pageState extends State<res_page> {
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
            right: "true",
            back_pic: "ast/11.png",
            buttonName: "Explore Research",
            cont:
                "Materials Engineers are leveraging their fundamental understanding up to the atomic scale in order to develop, and discover the materials of tomorrow for the future today. They are directly applying their classroom knowledge to challenges in manufacturing, metallurgical process development, biomaterials, automation with machine learning, and novel semiconductors. McMaster Materials Engineering students have completed co-ops on topics including phase formation analysis, silicon development, biocompatible implants, machine learning for autonomous materials development, and more!",
            pageTo: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 192, 124, 187))),
              child: const Text(
                "Go Research",
                style: TextStyle(fontFamily: "g2", fontWeight: FontWeight.bold),
              ),
              onPressed: load_res,
            ),
            title: "Research"),
        gen_mode(
          bandcol: Color.fromARGB(255, 192, 124, 187),
          appTitle: "Research",
          fileName: "ast/csv/res.csv",
        )
      ],
    );
  }
}
