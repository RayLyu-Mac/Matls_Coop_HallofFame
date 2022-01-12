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
            back_pic: "ast/4.png",
            buttonName: "Explore Biomaterials",
            cont:
                "Materials Engineers are pushing the envelope in how we change manufacturing to optimize for efficiency, and to increase the quality of products used in industry and infrastructure. They are tackling unique challenges with 3D printing, industry 4.0, and clean energy. McMaster Materials Engineering students have completed co-ops on topics including material production, processing and heat-treating, manufacturing, failure and forensic analysis, and more!",
            pageTo: ElevatedButton(
              child: Text("Go Manufacturing!"),
              onPressed: load_res,
            ),
            title: "Manufacturing"),
        gen_mode(
          appTitle: "Manufacturing",
          fileName: "ast/csv/manu.csv",
        )
      ],
    );
  }
}
