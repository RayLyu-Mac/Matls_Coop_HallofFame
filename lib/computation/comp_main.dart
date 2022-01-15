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
            right: "true",
            back_pic: "ast/bg/cp1.jpg",
            buttonName: "Explore Compuation",
            cont:
                "Materials Engineers are leveraging the ever increasing computational power that is available to us in order to speed up the design cycle and improve materials. They are applying data analytics and machine learning and AI to revolutionize the healthcare, manufacturing, and energy sectors. McMaster Materials Engineering students have completed co-ops on topics including process simulation and optimization, modeling decarbonization strategies, accelerated materials discovery and design, image and data processing, and more!",
            pageTo: ElevatedButton(
              child: Text(
                "Go Code!",
                style: TextStyle(fontFamily: "g2", fontWeight: FontWeight.bold),
              ),
              onPressed: load_res,
            ),
            title: "Computation"),
        gen_mode(
          appTitle: "Computation & Code",
          fileName: "ast/csv/code.csv",
        )
      ],
    );
  }
}
