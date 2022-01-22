import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/header_mode.dart';
import 'package:coop_hall_of_fame/gen_mode.dart';

class smr_page extends StatefulWidget {
  smr_page({Key? key}) : super(key: key);

  @override
  _smr_pageState createState() => _smr_pageState();
}

class _smr_pageState extends State<smr_page> {
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
            back_pic: "ast/bg/e1.png",
            buttonName: "Explore Smart Material",
            cont:
                "Materials Engineers are discovering new materials, and modifying existing ones to optimize for desirable electronic, magnetic and optical properties. They are tackling the world’s problems with nanotechnology, thin-films, coatings, and microfabrication. McMaster Materials Engineering students have completed co-ops on topics including sensors and microdevices, reverse engineering and failure analysis, material processing, quality control of advanced microdevices, and more!",
            pageTo: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 209, 204, 93))),
              child: const Text("Go Smart"),
              onPressed: load_res,
            ),
            title: "Smart Material"),
        gen_mode(
          bandcol: Color.fromARGB(255, 209, 204, 93),
          appTitle: "Smart Material",
          fileName: "ast/csv/smart.csv",
        )
      ],
    );
  }
}
